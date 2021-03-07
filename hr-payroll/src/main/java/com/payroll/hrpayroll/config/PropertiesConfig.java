package com.payroll.hrpayroll.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PropertiesConfig {
	
	@Value("${hr-worker.host}")
	String workerHost;

	public String getWorkerHost() {
		return workerHost;
	}

	public void setWorkerHost(String workerHost) {
		this.workerHost = workerHost;
	}
	
}
