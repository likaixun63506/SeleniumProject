package com.tarena.selenium;

import static org.junit.Assert.*;


import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;

import junit.framework.AssertionFailedError;

import org.apache.commons.io.FileUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.internal.WrapsDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;



public class Test28_cutPicture {
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
	public void testa() throws Exception {
		driver.get("http://localhost/ws/ecshop/upload/index.php");
		File sFile=((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
        //FileUtils.copyFile(sFile, new File("E:/Selenium/file.png"));
        //FileUtils.copyFile(sFile, new File("E:\\Selenium\\"+System.currentTimeMillis()+".png"));
		//获得指定页面元素的坐标位置
		WebElement element=driver.findElement(By.tagName("img"));
		Point point=element.getLocation();
        //获取元素宽度和高度
		int width=element.getSize().getWidth();
		int height=element.getSize().getHeight();
		//生成矩形
		Rectangle rect=new Rectangle(width,height);
		//使用BufferedImage类getSubimage方法获取制定矩形的截图
		BufferedImage img=ImageIO.read(sFile);
		BufferedImage target=img.getSubimage(point.getX(), point.getY(), rect.width, rect.height);
       //将截图保存
		ImageIO.write(target,"png", new File("E:\\Selenium\\"+getCurrentTime()+".png"));
		Thread.sleep(3000);
		System.out.println(getCurrentTime());
	}
	@Test
	public void testb() throws Exception {
		driver.get("file:///E:/Selenium/example/example/js.html");
		try {
			assertTrue(driver.getTitle().contains("Ecshop"));
		} catch (AssertionError e) {
			File sFile=((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
	        FileUtils.copyFile(sFile, new File("E:/Selenium/error.png"));	
	        assertFalse(true);
		}
		//获得指定页面元素的坐标位置
		
		Thread.sleep(3000);
		System.out.println(getCurrentTime());
	}
	@Test
	public void testc() throws Exception {
		driver.get("http://localhost/ws/ecshop/upload/index.php");
		WebElement element=driver.findElement(By.tagName("img"));
		WrapsDriver wra=(WrapsDriver) element;
		//设置高亮
		String styles="color:green;border:2px solid yellow";
		String js="arguments[0].setAttribute('style',arguments[1]);";
		JavascriptExecutor jse=(JavascriptExecutor) wra.getWrappedDriver();
		jse.executeScript(js, element,styles);
		//保存截图
		File sFile=((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
        FileUtils.copyFile(sFile, new File("E:/Selenium/wraps.png"));	
        Thread.sleep(5000);
        //取消高亮
        jse.executeScript(js, element,null);
        Thread.sleep(2000);
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
	
	private String getCurrentTime(){
		Calendar ca = Calendar.getInstance();
		String y =String.valueOf(ca.get(Calendar.YEAR));
		String m = String.valueOf(ca.get(Calendar.MONTH)+1);
		String d = String.valueOf(ca.get(Calendar.DATE));
		String h = String.valueOf(ca.get(Calendar.HOUR_OF_DAY));
		String mm = String.valueOf(ca.get(Calendar.MINUTE));
		String s = String.valueOf(ca.get(Calendar.SECOND));
	    return y+m+d+h+mm;
		
	}  
	
}
