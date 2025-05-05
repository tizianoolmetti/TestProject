//
//  TestProjectTests.swift
//  TestProjectTests
//
//  Created by Tiziano on 5/5/2025.
//

import XCTest
@testable import TestProject

class TestProjectTests: XCTestCase {
    func testExample() {
        // Example test
        XCTAssertEqual(1 + 1, 2, "Basic math should work")
    }
    
    func testYourAppFeature() {
        // Write tests for your app's features
        // For example, if you have a function that calculates something:
        // let result = YourClass().calculateSomething()
        // XCTAssertEqual(result, expectedValue)
    }
    
    // Test per la validazione di un indirizzo email
    func testEmailValidation() {
        let validEmail = "example@example.com"
        let invalidEmail = "invalid.email"
        
        XCTAssertTrue(isValidEmail(validEmail), "L'email valida dovrebbe passare la validazione")
        XCTAssertFalse(isValidEmail(invalidEmail), "L'email non valida non dovrebbe passare la validazione")
    }
    
    // Helper per la validazione dell'email
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    // Test per la formattazione di una stringa
    func testStringCapitalization() {
        let input = "hello world"
        let expected = "Hello World"
        
        XCTAssertEqual(capitalizeFirstLetters(input), expected, "Ogni parola dovrebbe avere la prima lettera maiuscola")
    }
    
    // Helper per la capitalizzazione
    private func capitalizeFirstLetters(_ string: String) -> String {
        return string.split(separator: " ")
            .map { String($0.prefix(1).uppercased() + $0.dropFirst()) }
            .joined(separator: " ")
    }
    
    // Test per la conversione di temperatura
    func testTemperatureConversion() {
        let celsius = 20.0
        let expectedFahrenheit = 68.0
        
        XCTAssertEqual(celsiusToFahrenheit(celsius), expectedFahrenheit, "20°C dovrebbe essere convertito in 68°F")
    }
    
    // Helper per la conversione di temperatura
    private func celsiusToFahrenheit(_ celsius: Double) -> Double {
        return (celsius * 9/5) + 32
    }
    
    // Test per il calcolo di una percentuale
    func testPercentageCalculation() {
        XCTAssertEqual(calculatePercentage(50, of: 200), 100, "50% di 200 dovrebbe essere 100")
        XCTAssertEqual(calculatePercentage(25, of: 80), 20, "25% di 80 dovrebbe essere 20")
    }
    
    // Helper per il calcolo della percentuale
    private func calculatePercentage(_ percentage: Double, of total: Double) -> Double {
        return (percentage / 100) * total
    }
    
    // Test per la formattazione di una data
    func testDateFormatting() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: "2025-05-05") else {
            XCTFail("La data non può essere creata")
            return
        }
        
        let formattedDate = formatDate(date)
        XCTAssertEqual(formattedDate, "05/05/2025", "La data dovrebbe essere formattata come dd/MM/yyyy")
    }
    
    // Helper per formattare una data
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    // Test per la validazione di un numero di telefono
    func testPhoneNumberValidation() {
        XCTAssertTrue(isValidPhoneNumber("+39 123 456 7890"), "Il numero di telefono valido dovrebbe passare la validazione")
        XCTAssertFalse(isValidPhoneNumber("123"), "Il numero di telefono non valido non dovrebbe passare la validazione")
    }
    
    // Helper per la validazione del numero di telefono
    private func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^\\+(?:[0-9] ?){6,14}[0-9]$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }
    
    // Test per l'ordinamento di un array
    func testArraySorting() {
        let unsortedArray = [5, 2, 9, 1, 7]
        let sortedArray = [1, 2, 5, 7, 9]
        
        XCTAssertEqual(sortArrayAscending(unsortedArray), sortedArray, "L'array dovrebbe essere ordinato in ordine crescente")
    }
    
    // Helper per l'ordinamento di un array
    private func sortArrayAscending(_ array: [Int]) -> [Int] {
        return array.sorted()
    }
    
    // Test per la generazione di un UUID
    func testUUIDGeneration() {
        let uuid1 = generateUUID()
        let uuid2 = generateUUID()
        
        XCTAssertNotEqual(uuid1, uuid2, "Due UUID generati dovrebbero essere diversi")
    }
    
    // Helper per la generazione di UUID
    private func generateUUID() -> String {
        return UUID().uuidString
    }
    
    // Test per la validazione di una password
    func testPasswordStrength() {
        XCTAssertTrue(isStrongPassword("P@ssw0rd123"), "Una password forte dovrebbe passare la validazione")
        XCTAssertFalse(isStrongPassword("password"), "Una password debole non dovrebbe passare la validazione")
    }
    
    // Helper per la validazione della password
    private func isStrongPassword(_ password: String) -> Bool {
        // Almeno 8 caratteri, almeno un numero, un carattere speciale e una lettera maiuscola
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
