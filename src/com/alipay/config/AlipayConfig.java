package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id ="2016092100561543";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCUckyJZHHvzAr38+L/wZT5xczJDxOibvivLTEmhLAM9iY5zRm4zCx2mpJsEPMiIL9yvfj78noCh0C33ASyGXTy/oO3xOvC0ftGLxc1ywAHbCZFm4TVPwhIxzlJgHcqtMp8//rrvz6neb0dM9lz5JwJH+GaEwPeefU4g/+hsjl7WD25lOF9W6V31Ja7/HkyEsT+sjz3nYgr2SYMUMbfZON+OaazhBleNWglGyz2bBJ+q4NdLKbL7oLickqCqfFaWxHNKxe2NaQCrTfKGy4PgIpDjwjCBFH0sdWwPQuidn9ctyWIgiBH2ib9kOcYgYIdyy9sFw2p2lVQ84MDUyL8lyNNAgMBAAECggEAXUmLAZiG5XxjtDinAbTEi0abkAqSezSjwWp0BdHC1RJnKVHUBUcB9jLjK1hngp3z0gbCjopt1GLs794rcUUAMqhxXC47Pr44231CZ8K/rOpxDrNSAbTP3vSb8q3xtXvR+EXhiP8xP4wIpW5tDCCxUiaf3vRuLQSVb0O8hP/8kZ8IWWi9cO7Kc2XaYweb+IgoLvBwmxbnY5IKe91WlGK0yTK5ttixI6oivNIEThifs4lX6/pZQl8Jnv5afpsnxE5+ikoEvwxOSJv1RjnPA4VVrmjo+FsQj70WbhwVReoUQFkLr4qUhhBPApJI5gy4J0yogkP2mAZ84ET5/+1nsr3GPQKBgQDJ0u8SxHGOtIvhNVyiBFv7KmjWKsl+KnqvRpR39hd/ECXHqSCkx0NTD57PeBIPPJlLcjWWifPJMScm1S9QbEZAqzy2FJZtry2ULon6vPsv8bgtT3vCcX69TUSTOE3RMt5fUFbjuZCVCJ+DsHkhivy6GznfD1Gxi9eVgGyHZZIjJwKBgQC8S1Z4IZtLWqAy1pdkqCJuHRuZiW7MaNRI/9rc1V3FH9qnpC2889ClD+MIHjrlvO1hY1Vc3rES4KCd5OB8TA6lQZQu0PlXDZy64ooQLQS7qvPLvpcmVDqCfXJqtwc4Jx29LyK21hmm0v12eXumJbzv3KfYPAI8Im9TASFAH2k+awKBgQCGnOpY2i3jwQiLbcwbRE0VeXPzZRZ/0FWEEs90M+/4EA0i3uum/EErZX/HYY6qGwEkEUks31Z7Gw3CGO819QHmoFAeIh0zi2QbMe9WDjZ8A/2UOy+QwaKHIMJcb3F31zX63NsXiO2mednrPAmPFeT7PK2c2drjUSK51K6OoHCYgQKBgC3nS/BDeSF4uX9LU2MlnicsD3NxzsIkeERHo6qclZyd9GdUHhZndiEXa2iqPf+N/Gz2k3Ptkkug2WdEyfljbVqaTy7OoUq4tdHVsoTZBMNfnMm58A1XEWCIhqE/d5IX7ycU26ipL129KC9+1EcgAhyTtZOApabVWkBpERsZzUV7AoGBAKWbAtIu0mB8R+fBj2zqMNqCh3TOJbtE6dOMsCkxgmHUBqOdlnsB798AFO3E+3MpH0jB4M1DxRvchiVDj56vrCxE1jB5ZlwX7Vx5iC8To/kres1BPf/MgEXicHlLmy8K8eh5OnwXBu/HocPunN6Bsn+RHpaJVpzjBgml9vRRWBDv";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlHJMiWRx78wK9/Pi/8GU+cXMyQ8Tom74ry0xJoSwDPYmOc0ZuMwsdpqSbBDzIiC/cr34+/J6AodAt9wEshl08v6Dt8TrwtH7Ri8XNcsAB2wmRZuE1T8ISMc5SYB3KrTKfP/6678+p3m9HTPZc+ScCR/hmhMD3nn1OIP/obI5e1g9uZThfVuld9SWu/x5MhLE/rI8952IK9kmDFDG32Tjfjmms4QZXjVoJRss9mwSfquDXSymy+6C4nJKgqnxWlsRzSsXtjWkAq03yhsuD4CKQ48IwgRR9LHVsD0LonZ/XLcliIIgR9om/ZDnGIGCHcsvbBcNqdpVUPODA1Mi/JcjTQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8090/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/rentMarket3.1/os.do?op=sel";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
			
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

