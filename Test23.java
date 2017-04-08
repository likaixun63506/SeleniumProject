package day09;


import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

public class Test23 {
    WebDriver driver;
    private boolean acceptNextAlert = true;
	@Before
	public void setUp() throws Exception {
		FirefoxProfile profile = new FirefoxProfile();
		  profile.setPreference(
	  		"dom.ipc.plugins.enabled", 
	  		false);
		driver = new FirefoxDriver(profile);
	   driver.manage().window().maximize();
	}
	@Test
	public void testa() throws Exception {
		driver.get("file:///E:/Selenium/example/table.html");
		//���Ա�������
//		List<WebElement> lists = driver.findElements(By.tagName("tr"));
//		assertEquals(6,lists.size());
		
		//���Ե����е�����
//		List<WebElement> cols = driver.findElements(By.xpath("//table/tbody/tr[4]/td"));
//		assertEquals(3,cols.size());
//		Thread.sleep(3000);
//		List<WebElement> cos4 = lists.get(3).findElements(By.tagName("td"));
//		assertEquals(3,cos4.size());
//		//���Ե����еڶ��еĵ�Ԫ���ı�
//		String text = driver.findElement(By.xpath("//table/tbody/tr[3]/td[2]")).getText();
//		assertEquals("$30.00",text);
		//��ȡ�����еڶ��е�һ���ı����������123
		WebElement element = driver.findElement(By.xpath("//table/tbody/tr[5]/td[2]/input[1]"));
		element.clear();
		element.sendKeys("123");
		Thread.sleep(3000);
	}
	@Test
	public void testb() throws Exception {
		driver.get("file:///E:/Selenium/example/table2.html");
//		List<WebElement> lists = driver.findElements(By.xpath("html/body/table[1]/tbody/tr"));
//		System.out.println(lists.size());
	    List<WebElement> lists2 = driver.findElements(By.xpath("html/body/table[2]/tbody/tr"));
//	    assertEquals(3,lists2.size());
		//��ȡ��һ��table�е�һ�а���������ͷ
//		List<WebElement> ths = lists.get(0).findElements(By.tagName("th"));
//		assertEquals(2,ths.size());
		//���Եڶ���table�еڶ��е�����������td and th��
//		List<WebElement> hds = driver.findElements(By.xpath("//table[2]/tbody/tr[2]/*"));
//		assertEquals(2,hds.size());
		//���Եڶ���table�еڶ��е�һ�������е��ı�
		String ss = lists2.get(1).findElement(By.tagName("td")).getText();
		assertEquals("555 77 854",ss);
		
		
	}
	@After
	public void tearDown() throws Exception {
		driver.quit();
	}
	

	

}
