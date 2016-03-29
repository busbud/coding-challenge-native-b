package com.ldev.osheaga.services;


import android.util.Log;
import com.ldev.osheaga.utils.NetworkUtils;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.springandroid.SpringAndroidSpiceRequest;
import com.octo.android.robospice.retry.DefaultRetryPolicy;

import org.springframework.http.ContentCodingType;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import android.net.Uri;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;

import java.net.URI;



public class DataRequestJson<T> extends SpringAndroidSpiceRequest<T> {
    public static final String TAG = DataRequestJson.class.getSimpleName();

    private String url;
    private String sessionToken;
    private boolean sessionTokenRefreshed = false;

    private String cacheKey;
    private Object dataToSend;
    private HttpMethod httpMethod;
    private HttpHeaders httpHeaders;



    public DataRequestJson(Class<T> responseClassType, String url) {
        this(responseClassType, url, HttpMethod.GET, null, null, null);
    }

    public DataRequestJson(Class<T> responseClassType, String url, HttpMethod httpMethod, Object dataToSend) {
        this(responseClassType, url, httpMethod, dataToSend, null, null);
    }

    public DataRequestJson(Class<T> responseClassType, String url, String token) {
        this(responseClassType, url, HttpMethod.GET, null, null, token);
    }

    public DataRequestJson(Class<T> responseClassType, String url, HttpMethod httpMethod, Object dataToSend, String token) {
        this(responseClassType, url, httpMethod, dataToSend, null, token);
    }

    public DataRequestJson(Class<T> responseClassType, String url, HttpMethod httpMethod, Object dataToSend, HttpHeaders httpHeaders) {
        this(responseClassType, url, httpMethod, dataToSend, null, httpHeaders, null);
    }

    public DataRequestJson(Class<T> responseClassType, String url, HttpMethod httpMethod, Object dataToSend, HttpHeaders httpHeaders, String token) {
        this(responseClassType, url, httpMethod, dataToSend, null, httpHeaders, token);
    }


    public DataRequestJson(Class<T> responseClassType, String url, HttpMethod httpMethod, Object dataToSend, String cacheKey, HttpHeaders httpHeaders, String token) {
        super(responseClassType);
        if (url == null) {
            Log.e(TAG, "URL is null");
            return;
        }

        this.url = url.trim();
        this.httpMethod = httpMethod;
        this.dataToSend = dataToSend;
        this.httpHeaders = httpHeaders;

        if (token != null) {
            // Used during the authentication use case
            this.sessionToken = token;
        }


        setRetryPolicy(new DefaultRetryPolicy() {
            @Override
            public void retry(SpiceException e) {
                boolean needResetRetryCount = false;
                if (sessionToken != null && NetworkUtils.is403HTTPError(e)) {
                    // Try to refresh the token and retry the call
                    if (!refreshTokens()) {
                        // Fail on refresh tokens
                        needResetRetryCount = true;
                    }

                } else if (!NetworkUtils.is404HTTPError(e) &&
                        !NetworkUtils.is408HTTPError(e) &&
                        !NetworkUtils.is429HTTPError(e)) {
                    // Disable retry in case of 4XX HTTP error except 404,408,429
                    needResetRetryCount = true;

                } else {
                    // Decrease the retry count normally
                    super.retry(e);
                }

                if (needResetRetryCount) {
                    // decrease retry count until 0
                    while (getRetryCount() >= 0) {
                        super.retry(e);
                    }
                }
            }
        });


    }

    @Override
    public T loadDataFromNetwork() throws Exception {
        // With Uri.Builder class we can build our url with a safe manner
        final Uri.Builder uriBuilder = Uri.parse(url).buildUpon();
        String url = uriBuilder.build().toString();

        URI uri = new URI(url);

        // Add headers
        if (httpHeaders == null) {
            httpHeaders = new HttpHeaders();
        }
        updateHeaders(httpHeaders);

        HttpEntity httpEntity = new HttpEntity<Object>(dataToSend, httpHeaders);
        ResponseEntity response = getRestTemplate().exchange(uri, getHttpMethod(), httpEntity, getResultType());
        Log.v(TAG, "response=" + response);
        return (T) response.getBody();
    }

    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // //
    // // HOOK METHODS
    // //
    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * Try to refresh tokens here, return true in case of success else false
     *
     * @return
     */
    public boolean refreshTokens() {
        return false;
    }

    /**
     * Before calling the download, update the headers of the request
     */
    public void updateHeaders(HttpHeaders httpHeaders) {

        httpHeaders.setAcceptEncoding(ContentCodingType.GZIP);
        httpHeaders.add("Accept", "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/");

//        String authorization = DataManager.getInstance().getAuthorization();
//
//        if(sessionToken!=null){
//            httpHeaders.add("Authorization","Basic "+sessionToken);
//        }else{
//            if (authorization != null) {
//                httpHeaders.set("Accept", "*/*");
//                httpHeaders.add("Authorization","Basic "+authorization);
//            }
//        }
    }



    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // //
    // // GETTER/SETTER
    // //
    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSessionToken() {
        return sessionToken;
    }

    protected void setSessionToken(String sessionToken) {
        this.sessionToken = sessionToken;
    }

    public boolean isSessionTokenRefreshed() {
        return sessionTokenRefreshed;
    }

    public void setSessionTokenRefreshed(boolean sessionTokenRefreshed) {
        this.sessionTokenRefreshed = sessionTokenRefreshed;
    }

    public String getCacheKey() {
        return cacheKey;
    }

    public void setCacheKey(String cacheKey) {
        this.cacheKey = cacheKey;
    }

    public Object getDataToSend() {
        return dataToSend;
    }

    public void setDataToSend(Object dataToSend) {
        this.dataToSend = dataToSend;
    }

    public HttpMethod getHttpMethod() {
        return httpMethod;
    }

    public void setHttpMethod(HttpMethod httpMethod) {
        this.httpMethod = httpMethod;
    }
}
