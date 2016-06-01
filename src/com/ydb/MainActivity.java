package com.ydb;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebSettings.LayoutAlgorithm;
import android.webkit.WebSettings.PluginState;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import com.ydb.R;

@SuppressLint("JavascriptInterface")
public class MainActivity extends Activity {
	private WebView webView;
	private static final int REQUEST_FILE_PICKER = 1;
	private ValueCallback<Uri> mFilePathCallback4;
	private ValueCallback<Uri[]> mFilePathCallback5;
	ValueCallback<Uri> mUploadMessage;
	 @Override
     protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
		 
			 Uri result = intent.getData();
			 mFilePathCallback4.onReceiveValue(result);
			 mFilePathCallback4 = null;
			super.onActivityResult(requestCode, resultCode, intent);
	 }
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		webView = new WebView(this);
		Log.i("pzy", "fuck" + webView.toString());
		webView.setHorizontalScrollBarEnabled(false);
		webView.getSettings().setLoadWithOverviewMode(true);
		webView.getSettings().setLayoutAlgorithm(LayoutAlgorithm.SINGLE_COLUMN);
		WebSettings s = webView.getSettings();
		s.setBuiltInZoomControls(true);
		s.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
		s.setUseWideViewPort(true);
		s.setLoadWithOverviewMode(true);
		s.setSavePassword(true);
		s.setSaveFormData(true);
		s.setJavaScriptEnabled(true);
		webView.setWebChromeClient(new WebChromeClient(){
			public void onPageFinished(WebView view, String url) { webView.loadUrl("javascript:(function() { var videos = document.getElementsByTagName('video'); for(var i=0;i<videos.length;i++){videos[i].play();}})()"); } 
		    public void openFileChooser(ValueCallback<Uri> filePathCallback)
		    {
		        mFilePathCallback4 = filePathCallback;
		        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
		        intent.addCategory(Intent.CATEGORY_OPENABLE);
		        intent.setType("*/*");
		        startActivityForResult(Intent.createChooser(intent, "File Chooser"), REQUEST_FILE_PICKER);
		    }

		    public void openFileChooser(ValueCallback filePathCallback, String acceptType)
		    {
		        mFilePathCallback4 = filePathCallback;
		        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
		        intent.addCategory(Intent.CATEGORY_OPENABLE);
		        intent.setType("*/*");
		        startActivityForResult(Intent.createChooser(intent, "File Chooser"), REQUEST_FILE_PICKER);
		    }

		    public void openFileChooser(ValueCallback<Uri> filePathCallback, String acceptType, String capture)
		    {
		        mFilePathCallback4 = filePathCallback;
		        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
		        intent.addCategory(Intent.CATEGORY_OPENABLE);
		        intent.setType("*/*");
		        startActivityForResult(Intent.createChooser(intent, "File Chooser"), REQUEST_FILE_PICKER);
		    }

		    @Override
		    public boolean onShowFileChooser(WebView webView, ValueCallback<Uri[]> filePathCallback, WebChromeClient.FileChooserParams fileChooserParams)
		    {
		        mFilePathCallback5 = filePathCallback;
		        Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
		        intent.addCategory(Intent.CATEGORY_OPENABLE);
		        intent.setType("*/*");
		        startActivityForResult(Intent.createChooser(intent, "File Chooser"), REQUEST_FILE_PICKER);
		        return true;
		    }
		});
		webView.addJavascriptInterface(this, "app");
		
		
		webView.setOnTouchListener(new View.OnTouchListener() {  
            @Override  
            public boolean onTouch(View v, MotionEvent event) {  
  
                switch (event.getAction()) {  
                case MotionEvent.ACTION_DOWN:  
                case MotionEvent.ACTION_UP:  
                    v.requestFocusFromTouch();  
                    break;  
                case MotionEvent.ACTION_MOVE:  
                    break;  
                case MotionEvent.ACTION_CANCEL:  
                    break;  
                }  
                return false;  
            }  
        });  
		webView.loadUrl("http://192.168.1.104:8080/weike/phone/login");
		
		webView.setWebViewClient(new WebViewClient() {
			public boolean shouldOverrideUrlLoading(WebView view, String url) {
				view.loadUrl(url);
				return true;
			}
		});
		webView.getSettings().setPluginState(PluginState.ON);
		webView.getSettings().setJavaScriptEnabled(true);
		setContentView(webView);
	}

}
