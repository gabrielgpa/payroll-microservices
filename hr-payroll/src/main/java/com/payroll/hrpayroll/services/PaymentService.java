package com.payroll.hrpayroll.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.payroll.hrpayroll.config.PropertiesConfig;
import com.payroll.hrpayroll.entities.Payment;
import com.payroll.hrpayroll.entities.Worker;

@Service
public class PaymentService {
	
	@Autowired
	private PropertiesConfig properties;
	
	@Autowired
	private RestTemplate restTemplate;
	
	public Payment getPayment(Long workerId, int days) {
		Map<String, String> uriVariable = new HashMap<>();
		uriVariable.put("id", Long.toString(workerId));
		
		Worker worker = restTemplate.getForObject(
				properties.getWorkerHost().concat("workers/{id}"),
				Worker.class, 
				uriVariable
		);
		
		return new Payment(worker.getName(), worker.getDailyIncome(), days);
	}
	
}
