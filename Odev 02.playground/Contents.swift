import UIKit

class Calculator {
    
    func kilometerToMiles(kilometer: Double) -> Double {
        return kilometer * 0.621371
    }
    
    func rectangleArea(length: Double, width: Double) {
        print("Rectangle Area: \(length * width)")
    }
    
    func factorial(number: Int) -> Int {
        guard number > 1 else {
            return 1
        }
        return number * factorial(number: number - 1)
    }
    
    func countE(in word: String) -> Int {
        var count = 0
        for char in word {
            if char == "e" {
                count += 1
            }
        }
        return count
    }
    
    func eachInteriorAngle(edgeCount: Int) -> Int {
        return (edgeCount - 2) * 180 / edgeCount
    }
    
    func salary(day: Int) {
        let hourlyWork = day * 8
        let normalWorkHour = 150
        let normalPayment = 40
        let overtimePayment = 80
        
        if hourlyWork < normalWorkHour {
            let payments = hourlyWork * normalPayment
            print("Total Payment: \(payments)")
        }
        else {
            let overtimeWorkHour = hourlyWork - normalWorkHour
            let normalPayment = normalWorkHour * normalPayment
            let overtimePayment = overtimeWorkHour * overtimePayment
            let totalPayments = normalPayment + overtimePayment
            print("Normal Payment: \(normalPayment) | Overtime Payment: \(overtimePayment) | Total Payment: \(totalPayments)")
        }
    }
    
    func parkingPrice(hourlyParkingTime: Int) {
        let oneHourNormalPrice = 50
        let hourlyOvertimePrice = 10
        
        if hourlyParkingTime == 1 {
            let price = oneHourNormalPrice
            print("Parking Price: \(price)")
        } else if hourlyParkingTime >= 1{
            let price = oneHourNormalPrice + (hourlyOvertimePrice * (hourlyParkingTime - 1))
            print("Hourly Parking Time: \(hourlyParkingTime) | Parking Price: \(price)")
        }
        else {
            print("Please enter valid value.")
        }
    }
}

let calculator = Calculator()

// kilometerToMiles
let miles = calculator.kilometerToMiles(kilometer: 100)
print("Miles: \(miles)")

// rectangleArea
calculator.rectangleArea(length: 50, width: 20)

// factorial
let factorial = calculator.factorial(number: 5)
print("Factorial: \(factorial)")

// countE
let example = "Merhaba, ben bir test cümlesiyim."
let result = calculator.countE(in: example)
print("Metin içinde \(result) adet 'e' harfi var.")

// eachInteriorAngle
let angle = calculator.eachInteriorAngle(edgeCount: 4)
print("Angle: \(angle)")

// salary
calculator.salary(day: 19)

// parkingPrice
calculator.parkingPrice(hourlyParkingTime: 2)
