package lang_country;

import java.util.Locale;

public class ViewAllLanugageAndCountryCode {
	public static void main(String[] args) {
		Locale[] availableLocales = Locale.getAvailableLocales();
		for (Locale locale : availableLocales) {
			System.out.println(locale.getDisplayCountry()+" : "+locale.getLanguage()+"_"+locale.getCountry());
		}
	}
}
