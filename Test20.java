package day08;


import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

public class Test20 {
   WebDriver driver;
   private boolean acceptNextAlert = trff;
	@Before
	public void setUp() throws Exception {
		FirefoxProfile profile = new FirefoxProfile();
		  profile.setPreference(
	  		"dom.ipc.plugins.enabled", 
	  		false);
		driver = new FirefoxDriver(profile);
	   driver.manage().window().maximize();
	}

	@After
	public void tearDown() throws Exception {
	   driver.quit();
	}
	@Test
	public void testa() throws Exception {
		driver.get("http://172.166.100.59/ws/ecshop/upload/admin/index.php");
		driver.findElement(By.name("username")).sendKeys("admin");
		driver.findElement(By.name("password")).sendKeys("admin123");
		driver.findElement(By.name("captcha")).sendKeys("0");
		driver.findElement(By.className("button")).click();
		driver.switchTo().frame("menu-frame");
		driver.findElement(By.linkText("��Ա�б�")).click();
		driver.switchTo().defaultContent();
		//�л�Frame
		driver.switchTo().frame("main-frame");
		//�����Ա����
		driver.findElement(By.name("keyword")).sendKeys("text");
		//��������
		driver.findElement(By.xpath("html/body/div[1]/form/input[4]")).click();
		//����
		assertEquals("gntest",driver.findElement(By.xpath(".//*[@id='listDiv']/table/tbody/tr[3]/td[2]")).getText());
		String s =driver.findElement(By.xpath(".//*[@id='listDiv']/table/tbody/tr[3]/td[2]")).getText();
		System.out.println(s);
		Thread.sleep(3000);
		driver.findElement(By.xpath(".//*[@id='listDiv']/table/tbody/tr[3]/td[10]/a[5]/img")).click();
		//����Alert�������Ƿ����
		assertTrue(isAlertPresent());
		acceptNextAlert = false;
		String aText = closeAlertAndGetItsText();
		//�л���defaultҳ��
		driver.switchTo().defaultContent();
		driver.switchTo().frame("header-frame");
		driver.findElement(By.linkText("�˳�")).click();
		
		Thread.sleep(3000);
		
	}
	private boolean isAlertPresent() {
	    try {
	      driver.switchTo().alert();
	      return true;
	    } catch (NoAlertPresentException e) {
	      return false;
	    }
	  }

	private String closeAlertAndGetItsText() {
	    try {
	      Alert alert = driver.switchTo().alert();
	      String alertText = alert.getText();
	      if (acceptNextAlert) {
	        alert.accept();
	      } else {
	        alert.dismiss();
	      }
	      return alertText;
	    } finally {
	      acceptNextAlert = true;
	    }
	  }
	  
}
