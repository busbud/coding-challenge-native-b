package com.ldev.osheaga.ui;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TimePicker;

import com.ldev.osheaga.R;


public class SearchActivity extends AppCompatActivity {


    public static String EXTRA_HOUR = "EXTRA_HOUR";
    public static String EXTRA_MIN = "EXTRA_MIN";

    public static Intent newIntent(Context context) {
        return new Intent(context, SearchActivity.class);
    }


    private TimePicker timePicker;
    private Button btDone;

    private int hour = 0;
    private int minute = 0;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search);

        timePicker = (TimePicker) findViewById(R.id.timePicker);
        btDone = (Button) findViewById(R.id.btDone);
        timePicker.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
            @Override
            public void onTimeChanged(TimePicker view, int hourOfDay, int minuteRes) {
                hour = hourOfDay;
                minute = minuteRes;
            }
        });

        btDone.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent resultIntent = new Intent();
                resultIntent.putExtra(EXTRA_HOUR, hour);
                resultIntent.putExtra(EXTRA_MIN, minute);
                setResult(Activity.RESULT_OK, resultIntent);
                finish();
            }
        });
    }
}
