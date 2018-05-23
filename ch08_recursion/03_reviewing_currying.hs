-- Tell results of given applications of following functions:

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy = flip cattyConny
appedCatty = cattyConny "woops"
frappe = flippy "haha"

-- Now the applications
x1 = appedCatty "wooho!"
-- "woops mrow wooho!

x2 = frappe "1"
-- "1 mrow haha"

x3 = frappe (appedCatty "2")
-- "woops mrow 2 mrow haha"

x4 = appedCatty (frappe "blue")
-- "woops mrow blue mrow haha"

x5 = cattyConny (frappe "ping")
                (cattyConny "green" (appedCatty "blue"))
-- "ping mrow haha mrow green mrow woops mrow blue"

x6 = cattyConny (flippy "Pugs" "are") "awesome"
-- "are mrow Pugs mrow awesome"