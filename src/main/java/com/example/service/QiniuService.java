package com.example.service;


import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class QiniuService {
	@Autowired
	private Environment env;

	@Value("${qiniu.accessKey}")
	private String ACCESS_KEY;

	@Value("${qiniu.secretKey}")
	private String SECRET_KEY;

	@Value("${qiniu.bucketName}")
	private String BUCKET_NAME;

//	private String ACCESS_KEY = env.getProperty("qiniu.accessKey");
//	private String SECRET_KEY = env.getProperty("qiniu.secretKey");
//	private String BUCKET_NAME = env.getProperty("qiniu.bucketName");
//	private UploadManager uploadManager = new UploadManager();
	public String getUpToken() {
		System.out.println(env.getProperty("qiniu.accessKey"));
		Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
		return auth.uploadToken(BUCKET_NAME);
	}

	public void upload(byte[] localData,String remoteFileName) throws IOException {
		UploadManager uploadManager = new UploadManager();
		Response res = uploadManager.put(localData, remoteFileName, getUpToken());
		System.out.println(res.bodyString());
	}

}
