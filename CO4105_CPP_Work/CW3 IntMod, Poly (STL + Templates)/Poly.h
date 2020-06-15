#include <iostream>
#include <vector>
using std::ostream;
using std::vector;

// templated class for a polynomial, with coefficients of type T
// The type T is assumed to have a zero element 0
// Furthermore T is assumed to have implemented:
//   the + operator;
//   the == operator;
//   the << operator.
template<typename T>
class Polynomial {
public:

	// Default constructor. Constructs the polynomial "0"
	Polynomial() {
		// IMPLEMENT ME
		this->poly.push_back(0);
		this->deg = 0;
	}

	// Value constructor. Constructs a polynomial based on the vector
	// of coefficients, in descending order of exponents.
	// For example, if coef contains {0,6,8,9,4}, then it constructs
	// the polynomial 6x^3 + 8x^2 + 9x + 4
	Polynomial(vector<T> other) {
		// IMPLEMENT ME

		bool check = true;
		for (T o : other) 
		{
			if (!(o == 0) && check || !check) 
			{
				check = false;
				deg++;
			}
		}

		deg--;

		for (int i = other.size() - 1; i >= 0; i--)
		{
			poly.push_back(other[i]);
		}
	}

	// default destructor, shallow copy constructor and copy assignment
	// should be ok

	// Return the degree of the polynomial.
	int degree() const {
		// IMPLEMENT ME
		// below are just stub code
		return deg;
	}

	// Return the coefficient of the x^i term. If i is negative or
	// larger than the degree, 0 is returned.
	T getCoef(int i) const {
		// IMPLEMENT ME
		// below are just stub code

		if (i < 0 || i > deg) 
		{
			return 0;
		}
		else 
		{
			return poly[i];
		}
	}

	// Addition of two polynomials. This time it is a member function
	Polynomial operator+(const Polynomial& other) const {
		// IMPLEMENT ME
		// below are just stub code
		Polynomial sum;
		
		if (this->poly.size() > other.poly.size()) 
		{
			sum.poly.resize(this->poly.size());
		}
		else 
		{
			sum.poly.resize(other.poly.size());
		}

		for (int i = 0; i < sum.poly.size(); i++) 
		{
			if (i >= other.poly.size()) 
			{
				sum.poly[i] = this->poly[i] + 0;
			}
			else if (i >= this->poly.size()) 
			{
				sum.poly[i] = 0 + other.poly[i];
			}
			else
			{
				sum.poly[i] = this->poly[i] + other.poly[i];
			}
		}
		vector<T> temp;
		for (int k = sum.poly.size() - 1; k >= 0; k--)
		{
			temp.push_back(sum.poly[k]);
		}
		
		
		bool check = true;
		int new_deg = 0;
		for (T p : temp) {
			if ((!(p == 0) && check) || !check) 
			{
				check = false;
				new_deg++;
			}
		}
		new_deg--;
		sum.deg = new_deg;

		return sum;
	}

	// Print the polynomial, in descending order of coefficients and
	// with the usual "x^..." terms.
	// It is not necessary to print it "pretty".
	// For example, if the polynomial is 2x^4 + x^3 - 5x - 1, it is
	// sufficient to print it as 2x^4 + 1x^3 + 0x^2 + -5x^1 + -1x^0
	// Minor formatting differences will be accepted.
	// If you print it pretty you get up to 5 bonus marks (out of 100
	// for this task). See the testPrintPretty() test case.
	// (This bonus part may not be as easy as it seems...)
	friend ostream& operator<<(ostream& os, const Polynomial<T>& p) {
		// IMPLEMENT ME
		for (int i = p.degree(); i >= 0; i--) 
		{
			if (i == 0)
			{
				os << p.getCoef(i) << "x^" << i;
			}
			else
			{
				os << p.getCoef(i) << "x^" << i << " + ";
			}
		}
		return os;
	}

private:
	// TODO: add any private variables/functions needed
	int deg = 0;
	vector<T> poly;
};
