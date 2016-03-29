package com.ldev.osheaga.ui;

import android.content.Context;
import android.support.annotation.ColorRes;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.ldev.osheaga.R;


public class MessageView extends RelativeLayout {

    private MessageViewInterface messageViewInterface;

    private ProgressBar progressBar;
    private TextView textViewErrorMessage;
    private TextView textViewInformation;
    private Button btRetry;
    private RelativeLayout blueBox;


    private
    @ColorRes
    int infoBoxColor;
    private
    @ColorRes
    int backgroundColor;
    private
    @ColorRes
    int textColor;
    private
    @ColorRes
    int textErrorColor;

    public interface MessageViewInterface {
        public void retry();
    }

    public MessageView(Context context) {
        super(context);
        init(context);
    }

    public MessageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public MessageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(context);
    }

    public void init(Context context) {
        LayoutInflater.from(context).inflate(R.layout.message_view, this, true);
        progressBar = (ProgressBar) findViewById(R.id.pgLoading);
        textViewErrorMessage = (TextView) findViewById(R.id.tvError);
        btRetry = (Button) findViewById(R.id.btRetry);
        textViewErrorMessage.setVisibility(View.GONE);
        blueBox = (RelativeLayout) findViewById(R.id.blueBox);
        textViewInformation = (TextView) findViewById(R.id.tvInformation);

        infoBoxColor = R.color.colorPrimaryDark;
        backgroundColor = R.color.backgroundColor;
        textColor = android.R.color.white;

    }

    public void setProperties(@ColorRes int infoBoxColor, @ColorRes int backgroundColor, @ColorRes int textColor, @ColorRes int textErrorColor) {
        this.infoBoxColor = infoBoxColor;
        this.backgroundColor = backgroundColor;
        this.textColor = textColor;
        this.textErrorColor = textErrorColor;


        textViewInformation.setTextColor(ContextCompat.getColor(getContext(), textColor));
        textViewErrorMessage.setTextColor(ContextCompat.getColor(getContext(), textErrorColor));
        setBackgroundColor(ContextCompat.getColor(getContext(), backgroundColor));
        blueBox.setBackgroundColor(ContextCompat.getColor(getContext(), infoBoxColor));
    }

    public void setMessageViewInterface(final MessageViewInterface messageViewInterface) {
        this.messageViewInterface = messageViewInterface;
        btRetry.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                messageViewInterface.retry();
            }
        });
    }

    public void setMessageInformation(String text) {
        this.setVisibility(View.VISIBLE);
        this.setBackgroundColor(ContextCompat.getColor(getContext(), backgroundColor));
        blueBox.setBackgroundColor(ContextCompat.getColor(getContext(), infoBoxColor));
        textViewInformation.setVisibility(View.VISIBLE);
        textViewInformation.setText(text);
    }

    public void setMessageError(String text) {
        this.setVisibility(View.VISIBLE);
        hideProgessBar();
        this.textViewInformation.setVisibility(View.GONE);
        this.setBackgroundColor(ContextCompat.getColor(getContext(), R.color.backgroundColor));
        blueBox.setBackgroundColor(ContextCompat.getColor(getContext(), R.color.transparent));
        textViewErrorMessage.setVisibility(View.VISIBLE);
        textViewErrorMessage.setText(text);
        if (messageViewInterface != null) {
            btRetry.setVisibility(View.VISIBLE);
        }
    }

    public void showProgressBar() {
        hideMessageError();
        progressBar.setVisibility(View.VISIBLE);
        progressBar.animate();
    }

    public void hideMessageError() {
        textViewErrorMessage.setVisibility(View.GONE);
        btRetry.setVisibility(View.GONE);
    }

    public static void hideLoadingView(MessageView messageView) {
        if (messageView != null) {
            messageView.hideProgessBar();
            messageView.setVisibility(View.GONE);
        }
    }

    private void hideProgessBar() {
        progressBar.setVisibility(View.GONE);
        progressBar.clearAnimation();
    }
}