void main() {
  // List of item prices in the cart
  List<double> cartPrices = [20.0, 5.0, 12.5, 50.0, 8.0];
  
  // Filter out items priced below $10 using an anonymous function
  List<double> filteredPrices = cartPrices.where((price) => price >= 10.0).toList();
  print('Filtered Prices: $filteredPrices');
  
  // Apply a 10% discount to each item in the cart using a higher-order function
  List<double> discountedPrices = applyDiscount(filteredPrices, (price) => price * 0.90);
  print('Discounted Prices: $discountedPrices');
  
  // Calculate total price including tax (optional parameter for tax)
  double totalPrice = calculateTotal(discountedPrices, taxRate: 0.05);
  print('Total Price after applying tax: \$${totalPrice.toStringAsFixed(2)}');
  
  // Calculate factorial discount (recursive function) based on the number of items in the cart
  int numberOfItems = discountedPrices.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems) / 100.0;
  
  // Apply factorial discount
  double finalPrice = totalPrice * (1 - factorialDiscount);
  print('Final Price after applying factorial discount: \$${finalPrice.toStringAsFixed(2)}');
}

// Function to calculate the total price of the cart, with an optional tax parameter
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.fold(0, (sum, item) => sum + item);
  return total + (total * taxRate);
}

// Higher-order function to apply a discount to each price in the list
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// Recursive function to calculate a discount based on the factorial of the number of items
int calculateFactorialDiscount(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}
