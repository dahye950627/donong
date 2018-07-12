package team.swcome.donong.aop;

import java.lang.reflect.Method;
import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AOPLogger {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@SuppressWarnings("rawtypes")
	@Around("execution(* team.swcome.donong.controller.*.* (..)) "
			+ "or execution(* team.swcome.donong.service.*.* (..)) "
			+ "or execution(* team.swcome.donong.dao.*.* (..))")
	public Object LoggerAspect(ProceedingJoinPoint joinPoint) throws Throwable {
		String targetName = joinPoint.getTarget().getClass().getSimpleName();
		for (Object arg : joinPoint.getArgs()) {
			if(arg instanceof List) {
				for(Object resEach : ((List)arg)) {
					StringBuilder sb = new StringBuilder(resEach.getClass().getSimpleName() + " {");
					Method[] methods = resEach.getClass().getMethods();
					
					for(Method method: methods) {
						String methodName = method.getName();
						if(methodName.startsWith("get") && methodName != "getClass") {
							sb.append(methodName.substring(3, methodName.length()) + " : " +method.invoke(resEach) + ", ");
						}
					}
					String logString = sb.substring(0, sb.length() - 2) + "}";
					logger.trace("{} ==> {}", logString , targetName);
				}
			} else {
				logger.trace("{} ==> {}", arg, targetName);
			}
		}
		Object res = joinPoint.proceed();
		if(res instanceof List) {
			for(Object resEach : ((List)res)) {
				StringBuilder sb = new StringBuilder(resEach.getClass().getSimpleName() + " {");
				Method[] methods = resEach.getClass().getMethods();
				
				for(Method method: methods) {
					String methodName = method.getName();
					if(methodName.startsWith("get") && methodName != "getClass") {
						sb.append(methodName.substring(3, methodName.length()) + " : " +method.invoke(resEach) + ", ");
					}
				}
				String logString = sb.substring(0, sb.length() - 2) + "}";
				logger.trace("{} <== {}", logString , targetName);
			}
		} else {
			logger.trace("{} <== {}", res, targetName);
		}
		return res;
	}
}