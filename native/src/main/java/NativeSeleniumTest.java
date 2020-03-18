package main.java;

import com.google.gson.Gson;
import org.openqa.selenium.Proxy;
import org.openqa.selenium.Proxy.ProxyType;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class NativeSeleniumTest {

    public void run() {
        ChromeOptions options = new ChromeOptions();
        options.setAcceptInsecureCerts(true);
        Proxy proxy = new Proxy();
        proxy.setProxyType(ProxyType.MANUAL);
        proxy.setHttpProxy("http://10.43.216.8:8080");
        proxy.setNoProxy(".minikube");
        options.setProxy(proxy);
        ChromeDriver driver = new ChromeDriver(options);
//        ChromeDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, 10000);
        try {
//            driver.get("https://ota-dashboard.minikube:30020/main");
            System.out.println(new Gson().toJson(driver.getCapabilities().asMap()));
            driver.get("https://www.microsoft.fr");
            Thread.sleep(3000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public static void main(String[] args) {
        new NativeSeleniumTest().run();
    }
}
