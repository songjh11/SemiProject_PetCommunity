package com.pet.home.sell.check;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping()
public class ImportController {
	//클라이언트가 결제를 하면 이쪽으로 imp_uid, merchant_uid가 넘어오고
	//client 객체를 통해서 토큰을 발급 받고
	//imp_uid를 이용하여 아임포트 서버에서 결제 내역을 조회하고 
	//DB에서 결제금액 조회하고
	
	IamportClient client = new IamportClient("7768266328715148", "uETnhxe3MbNMjFN4Gs6U5PuiYYR6TWf9SFcGncxj9SWEcDAysad8JZmNnOYpChUkXzIdw7Ld9uTaSWuP", true);
	
	public void getToken() throws Exception {
		IamportResponse<AccessToken> ipList = client.getAuth();
		
	}
	
	@PostMapping()
	@ResponseBody
	public void setCheck(@RequestParam String imp_uid, @RequestParam String userName) throws Exception {
		System.out.println(imp_uid);
		System.out.println(userName);
		
		try {
			IamportResponse<AccessToken> ipList = client.getAuth();
			IamportResponse<Payment> paymentResponse = client.paymentByImpUid("imp12326472");
			System.out.println(paymentResponse.getResponse().getAmount());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  //TODO : 처리 로직
		catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO : 401 Unauthorized 
				break;
			case 404 :
				//TODO : imp_123412341234 에 해당되는 거래내역이 존재하지 않음
			 	break;
			case 500 :
				//TODO : 서버 응답 오류
				break;
			}
			}
		} 

}

