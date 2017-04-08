package com.tarena.selenium;

import static org.junit.Assert.*;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Test26_mouse_key {
	WebDriver driver;

	@Before
	public void setUp() throws Exception {
		FirefoxProfile profile = new FirefoxProfile();
		profile.setPreference("dom.ipc.plugins.enabled", false);
		driver = new FirefoxDriver(profile);
		driver.manage().window().maximize();
		// 隐式等待时间
		// driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);

	}

	@Test
	public void testb() throws Exception {
	
driver.get("file:///E:/Seenium/example/example/message.html");
		driver.finElement(By.name("name")).sendKeys("jack");
driver.get("file:///E:/Selenium/example/example/message.html");
		driver.findElement(By.name("name")).sendKeys("jack");
		//要复制的元素
		WebElement element1 = driver.findElement(By.name("name"));
		Actions action = new Actions(driver);
//		element1.sendKeys(Keys.CONTROL, "a");
//		element1.sendKeys(Keys.CONTROL, "c");
		
		action.sendKeys(element1,Keys.CONTROL,"a","c").build().perform();
		Thread.sleep(3000);
		WebElement element2 = driver.findElement(By.name("e-mail"));
		action.sendKeys(Keys.NULL).build().perform();
		//element2.sendKeys(Keys.CONTROL, "v");
		action.sendKeys(element2,Keys.CONTROL,"v").build().perform();
		Thread.sleep(3000);
	}

	@Test
	public void testc() throws Exception {
		driver.get("file:///E:/Selenium/example/example/message.html");
		driver.findElement(By.name("name")).sendKeys("jack");
		WebElement element = driver.findElement(By.name("name"));
		element.sendKeys(Keys.CONTROL, "a");
		element.sendKeys(Keys.CONTROL, "c");
		// Ctrl+V
		WebElement element1 = driver.findElement(By.name("e-mail"));
		element1.sendKeys(Keys.CONTROL, "v");
		Actions action = new Actions(driver);
		WebElement element2 = driver.findElement(By.name("comments"));
		action.doubleClick(element1).build().perform();
		// action.click(element1).build().perform();
		// Thread.sleep(3000);
		// 鼠标右击
		action.contextClick(element1).build().perform();
		Thread.sleep(3000);
		// 选择复制
		action.sendKeys(Keys.ARROW_DOWN).sendKeys(Keys.ARROW_DOWN).sendKeys(
				Keys.ARROW_DOWN).sendKeys(Keys.ENTER).build().perform();
		action.contextClick(element2).build().perform();
		Thread.sleep(3000);
		// 选择粘贴
		action.sendKeys(Keys.ARROW_DOWN).sendKeys(Keys.ARROW_DOWN).sendKeys(
				Keys.ARROW_DOWN).sendKeys(Keys.ARROW_DOWN).sendKeys(Keys.ENTER)
				.build().perform();
		Thread.sleep(3000);
	}

	@After
	public void tearDown() throws Exception {
		driver.quit();
	}
}
