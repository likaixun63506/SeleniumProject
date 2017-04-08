package com.tarena.selenium;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Test27_js {
	WebDriver driver;

	@Before
	public void setUp() throws Exception {
		FirefoxProfile pfile = new FirefoxProfile();
		profile.setPreference("dom.ipc.plugins.enabled", false);
		driver = new FirefoxDriver(profile);
		driver.manage().window().maximize();
		// 隐式等待时间
		// driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);

	}
	@Test
	public void testb() throws Exception {
		driver.get("file:///E:/Selenium/example/example/js.html");
		//返回页面的title
		String js="return document.title;";
	
		String title=(String) ((JavascriptExecutor)driver).executeScript(js);
		System.out.println("title--->"+title);//执行js
		Thread.sleep(3000);
	}
	@Test
	public void testa() throws Exception {
		driver.get("file:///E:/Selenium/example/example/js.html");
		String js="document.getElementById('username').setAttribute('value','abc')";
		//在用户名文本框中输入abc
		((JavascriptExecutor)driver).executeScript(js);
		Thread.sleep(3000);
	}
	@Test
	public void testc() throws Exception {
		driver.get("file:///E:/Selenium/example/example/js.html");
		//返回页面中input标签个数
		String js="var inputs = document.getElementsByTagName('input');return inputs.length;";
	
		Long count=(Long) ((JavascriptExecutor)driver).executeScript(js);
		System.out.println("count--->"+count);//执行js
		Thread.sleep(3000);
	}
	
	@Test
	public void testd() throws Exception {
		driver.get("file:///E:/Selenium/example/example/js.html");
		//单击登录按钮方式一
		String js="document.getElementById('submit').click();";
		 ((JavascriptExecutor)driver).executeScript(js);
		//单击登录按钮方式二
		WebElement element=driver.findElement(By.id("submit")) ;
		String js1="arguments[0].click();";
	    ((JavascriptExecutor)driver).executeScript(js1,element,element);
		
		Thread.sleep(3000);
	}
	@Test
	public void teste() throws Exception {
		//源文件中没有Javascript代码也可以执行
		driver.get("file:///E:/Selenium/example/example/id.html");
		String js="document.getElementById('username').setAttribute('value','abc')";
		//在用户名文本框中输入abc
		((JavascriptExecutor)driver).executeScript(js);
		Thread.sleep(3000);
	}
	
	@Test
	public void testf() throws Exception {
		driver.get("file:///E:/Selenium/example/example/js.html");
		WebElement element1=driver.findElement(By.id("username")) ;
		WebElement element2=driver.findElement(By.id("password")) ;
		//多参数的情况
		String userNameJs1="arguments[0].setAttribute('value','abc');arguments[1].setAttribute('value','def')";
		
		((JavascriptExecutor)driver).executeScript(userNameJs1,element1,element2);
		
		Thread.sleep(3000);
	}
	
	@Test
	public void testg() throws Exception {
		//日历的处理
		driver.get("file:///E:/Selenium/example/example/calendar.html");
		//删除只读属性
		String js="document.getElementById('train_date').removeAttribute('readonly');";
		((JavascriptExecutor)driver).executeScript(js);
		//输入固定日期“2017-10-1”
		driver.findElement(By.id("train_date")).sendKeys("2017-10-1");
		Thread.sleep(3000);
		driver.findElement(By.id("train_date")).clear();
		//输入8天后的日期
		Calendar c=Calendar.getInstance();
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		c.add(Calendar.DAY_OF_MONTH, 8);
		driver.findElement(By.id("train_date")).sendKeys(sim.format(c.getTime()));
		Thread.sleep(3000);
	}
	
	

	@Test
	public void testh() throws Exception {
		//日历的处理
		driver.get("file:///E:/Selenium/example/example/calendar.html");
		//删除只读属性
		String js="document.getElementById('train_date').removeAttribute('readonly');";
		((JavascriptExecutor)driver).executeScript(js);
		//输入固定日期“2017-10-1”
		driver.findElement(By.id("train_date")).sendKeys("2017-10-1");
		Thread.sleep(3000);
		driver.findElement(By.id("train_date")).clear();
		//输入8天后的日期
		Calendar c=Calendar.getInstance();
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		c.add(Calendar.DAY_OF_MONTH, 8);
		driver.findElement(By.id("train_date")).sendKeys(sim.format(c.getTime()));
		Thread.sleep(3000);
	}
	@Test
	public void testcc() throws Exception {
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
