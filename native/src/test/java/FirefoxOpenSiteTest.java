import com.google.gson.Gson;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Proxy;
import org.openqa.selenium.Proxy.ProxyType;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class FirefoxOpenSiteTest {

    FirefoxDriver driver;

    @Before
    public void testBefore() {
        FirefoxOptions options = new FirefoxOptions();
        options.setAcceptInsecureCerts(true);
        Proxy proxy = new Proxy();
        proxy.setProxyType(ProxyType.MANUAL);
        proxy.setHttpProxy("10.43.216.8:8080");
        proxy.setSslProxy("10.43.216.8:8080");
        proxy.setNoProxy("");
        proxy.setAutodetect(false);
        options.setProxy(proxy);
        options.setHeadless(true);
        driver = new FirefoxDriver(options);
        System.out.println(new Gson().toJson(driver.getCapabilities().asMap()));
    }

    @After
    public void testAfter() {
        driver.quit();
    }

    @Test
    public void openSite() {
        driver.get("https://www.microsoft.fr");
        WebDriverWait wait = new WebDriverWait(driver, 5000);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("primaryArea")));
        Assert.assertNotNull(driver.findElement(By.id("primaryArea")));
    }
}
