package com.travel;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * AI旅行计划系统启动类
 */
@SpringBootApplication
@MapperScan("com.travel.mapper")
public class TravelPlanApplication {
    public static void main(String[] args) {
        SpringApplication.run(TravelPlanApplication.class, args);
        System.out.println("========================================");
        System.out.println("AI旅行计划系统启动成功！");
        System.out.println("后端服务地址: http://localhost:8090");
        System.out.println("========================================");
    }
}

