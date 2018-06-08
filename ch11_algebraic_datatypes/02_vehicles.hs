data Manufacturer = Mini
                  | Mazda
                  | Tata
                  deriving (Eq, Show)

data Airline = PapuAir
             | CatapultsR'US
             | TakeYourChancesUnited
             deriving (Eq, Show)

data Price = Price Integer deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline
             deriving (Eq, Show)

myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir

-- 1. What is the type of myCar?
--    Vehicle

-- 2. Write functions' implementations:
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _         = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Now implement a function to return manufacturer
getManu :: Vehicle -> Manufacturer
getManu (Car manu _) = manu
getManu _            = error "not a car"

-- 4. It will crash

-- 5. Add size of the plane to Plane constructor. Modify rest of the code.
--    data Vehicle = Plane Airline Integer
--    doge     = Plane PapuAir 29
--    isPlane (Plane _ _) = True