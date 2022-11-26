from selenium.webdriver.support.color import Color


def get_hex_color(rgba):
    return Color.from_string(rgba).hex
