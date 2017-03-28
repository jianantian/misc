from abc import ABCMeta, abstractmethod

class Vehicle(object, metaclass=ABCMeta):
    """A vehicle for sale by Jeffco Car Dealership.

    Attributes:
        wheels:
        miles:
        make:
        model:
        year:
        sold_on:
    """


    base_sale_price = 0
    wheels = 0

    def __init__(self, miles, make, model, year, sold_on):
        self.miles = miles
        self.make = make
        self.model = model
        self.year = year
        self.sold_on = sold_on

    def sale_price(self):
        if self.sold_on is not None:
            return 0.0
        else:
            return 5000.0 * self.wheels

    def purchase_price(self):
        if self.sold_on is not None:
            return 0.0
        else:
            return self.base_sale_price - (0.10 * self.miles)
    
    @abstractmethod
    def vehicle_type(self):
        pass
    
vehicle = Vehicle(0, "Honda", "City", 2, None)
print(vehicle.wheels)
