package com.ld.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;

import com.authorize.impl.AuthorizeImpl;
import com.ld.domain.User;

public class HttpClientUtil extends AuthorizeImpl
{
	public static String commentClient(String url, Map<String, String> params) throws ClientProtocolException, IOException
	{
		HttpClient hc = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		for (String param : params.keySet())
		{
			nvps.add(new BasicNameValuePair(param, params.get(param)));
		}
		httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
		HttpResponse response = hc.execute(httpPost);
		HttpEntity entity = response.getEntity();
		String result = null;
		if (entity != null)
		{
			result = EntityUtils.toString(entity);
		}
		hc.getConnectionManager().shutdown();
		return result;
	}

	public static void main(String[] args)
	{
		Map<String, String> map = null;
		// grant_type=authorization_code&client_id="+qqAppId+"&client_secret
		// "+aaAppKey+"&code="+code+"&redirect_uri="+qqRedirectUri
		map = new HashMap<String, String>();
		map.put("grant_type", "authorization_code");
		map.put("client_id", qqAppId);
		map.put("client_secret", aaAppKey);
		map.put("code", "CC9FA5C3B99A7CD33DCA122E0A8F4021");
		map.put("redirect_uri", qqRedirectUri);
		try
		{
			// String a = commentClient(qqAcctssUrl, map, "utf-8");
			// System.out.println(a);

			map = new HashMap<String, String>();

			// map.put("access_token", a.split("&")[0].split("=")[1]);

			// System.out.println(commentClient(qqOpenIdUrl, map, "utf-8"));

			map.put("access_token", "A91FD3555EB5CCD6D26A96BC3E35F73D");
			map.put("oauth_consumer_key", qqAppId);
			map.put("openid", "60891791283C05B253B9C3973A9BC337");
			map.put("format", "json");

			String rJ = commentClient(qqUserInfoUrl, map);
			System.out.println(rJ);
			ObjectMapper objectMapper = new ObjectMapper();
		//	User user = objectMapper.readValue(rJ, User.class);
			
			 Map<String, Map<String, Object>> maps = objectMapper.readValue(rJ, Map.class);
			
			System.out.println(maps.get("figureurl_2"));
			

		}
		catch (ClientProtocolException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// access_token=A91FD3555EB5CCD6D26A96BC3E35F73D&expires_in=7776000
		// callback(
		// {"client_id":"100444179","openid":"60891791283C05B253B9C3973A9BC337"}
		// );

		// openid=60891791283C05B253B9C3973A9BC337&format=json

	}

	public void test()
	{
		// JSONObject jo = (JSONObject) JSONValue.parse(result);

		/*
		 * Iterator iter = jo.keySet().iterator();
		 * while (iter.hasNext())
		 * {
		 * String key = iter.next().toString();
		 * model.addAttribute(key, jo.get(key));
		 * System.out.println("[key=" + key + ", val=" + jo.get(key) + "]");
		 * }
		 */
		// 生成JSONObject对象 JSONObject new_jo = new JSONObject();

	}
}
