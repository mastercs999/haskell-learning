-- Determine what expression are broken and fix them

-- 1. NO
-- bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10
bigNum = (^) 5 $ 10
wahoo = bigNum ^ 10

-- 2. YES
x = print
y = print "wooho!"
z = x "hello world"

-- 3. NO
-- a = (+)
-- b = 5
-- c = b 10
-- d = c 200
a = (+)
b = 5
c = a b 10
d = a c 200

-- 4. NO
-- a2 = 12 + b2
-- b2 = 10000 * c2
c2 = 5
b2 = 10000 * c2
a2 = 12 + b2