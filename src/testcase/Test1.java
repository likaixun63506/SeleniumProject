package testcase;

import static org.junit.Assert.*;

import java.util.concurrent.TimeUnit;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

import utility.Log;



public class Test1 {
	WebDriver driver;
	private boolean acceptNextAlert = true;

	@Before
	public void setUp() throws Exception {
		FirefoxProfile profile = new FirefoxProfile();
		profile.setPreference("dom.ipc.plugins.enabled", false);
		driver = new FirefoxDriver(profile);	
		//窗口最大化
		driver.manage().window().maximize();
		//设置等待时间
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
	}
	
	@Test
	public void test() {
		 driver.get("http://172.166.100.103:85");
		 Log.info("firfox is pen");
		 driver.findElement(By.name("account")).sendKeys("admin");
		 driver.findElement(By.name("submit")).click();
		 
		 
	}

}
