"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""
def calculator(a, b, operator):
    if operator == 'plus':
        return a + b
    else:
        return a - b
    
def get_key(val, dictionnary):
    for key, value in dictionnary.items():
        if val == value:
            return key
    
possible_numbers = {0:'zero', 1:'one', 2:'two', 3:'three', 4:'four', 5:'five'}

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')

a = input('Please choose your first number (zero to five): ')
operator = input('What do you want to do? plus or minus: ')
b = input('Please choose your second number (zero to five): ')

if not (a and b) in possible_numbers.values():
    print("I am not able to answer this question. Check your input.")
else:  
    print(f'{a} {operator} {b} equals {calculator(get_key(a, possible_numbers), get_key(b, possible_numbers), operator)}')

print("Thanks for using this calculator, goodbye :)")
