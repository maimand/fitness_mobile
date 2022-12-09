import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String title;
  final String url;

  const NewsWebView({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool _isLoading = true;
  bool _isBreadCrumbsRemoved = false;
  bool _isADCarRemoved = false;

  late final String _javascript;
  late final String _reviewsJavascript;

  @override
  void initState() {
    super.initState();

    // Remove breadcrumbs.
    _javascript = 'var styles = `.bread-cr {display: none;}`;'
        'var styleSheet = document.createElement("style");'
        'styleSheet.innerText = styles;'
        'document.head.appendChild(styleSheet);';

    // Remove AD Car in reviews.
    _reviewsJavascript = 'var styles = `.new-car-review {display: none;}`;'
        'var styleSheet = document.createElement("style");'
        'styleSheet.innerText = styles;'
        'document.head.appendChild(styleSheet);';
  }

  void _onPageStarted(String url) async {
    debugPrint(url);

    _isBreadCrumbsRemoved = false;
  }

  void _onProgress(int loadPercent) async {
    // Click to "Browse Used Cars" in MegaHuat webview page
    // will close UsedCar webview page.

    debugPrint(loadPercent.toString());

    if (loadPercent > 10 && _isLoading) {
      setState(() {
        _isLoading = false;
      });
    }
    if (loadPercent >= 30 && !_isBreadCrumbsRemoved) _removeUnnecessaryParts();
    if (loadPercent >= 49 && !_isADCarRemoved) {
      _removeUnnecessaryParts(isADCar: true);
    }
  }

  void _removeUnnecessaryParts({bool isADCar = false}) {
    _controller.future.then((webViewController) => webViewController
        .runJavascript(isADCar ? _reviewsJavascript : _javascript)
        .then((_) {
      if (isADCar) {
        debugPrint("reviews: remove AD Car");
        _isADCarRemoved = true;
      } else {
        debugPrint("remove breadcrumbs");
        _isBreadCrumbsRemoved = true;
      }
    }).catchError((onError) {
      debugPrint('$onError');
    }));
  }

  Future<bool> _onWillPop() async {
    final WebViewController webViewController = await _controller.future;
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    } else {
      Navigator.pop(context);
      return Future.value(true);
    }
  }

  Future<void> _onBack() async {
    final WebViewController webViewController = await _controller.future;
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: colors.primary,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              // color: colors.neutral1,
            ),
            onPressed: () => _onBack(),
          ),
          title: Text(
            widget.title,
            // style: styles.poppinsSemiBold16.apply(color: colors.neutral1),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                initialUrl: widget.url,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onPageStarted: _onPageStarted,
                onProgress: _onProgress,
              ),
              if (_isLoading)
               const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
