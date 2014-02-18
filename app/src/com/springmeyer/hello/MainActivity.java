package com.springmeyer.hello;

import android.os.Bundle;
import android.app.Activity;
import android.widget.TextView;
import android.util.Log;

public class MainActivity extends Activity {
	
	static {
		//System.loadLibrary("gnustl_shared");
		System.loadLibrary("mylib");
	}
	
	public native String stringFromJNI();

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
    TextView  tv = new TextView(this);
    tv.setText( stringFromJNI() );
    setContentView(tv);
	}

}
