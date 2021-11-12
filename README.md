# Academy iOS 2021

The repository will be used for trainees to save course progress. 
The course is divided into modules, for each module the user will create his own branch to work with the format:

![git](https://user-images.githubusercontent.com/416904/121977808-33d23980-cd5d-11eb-92d6-c9ba3e3e5d30.jpg)



# Module 1

## 1) Playground 

### Exercise 1:
Given the variable distance: 

```swift
let distance: UInt = 10
```
  
Write a switch using interval matching that... 
- Prints "Here" if distance is 0. 
- Prints "Immediate vicinity" if distance is less than 5 but more than 0.
- Prints "Near" if distance is between 5 and 15, including 15. 
- Prints "Kind of far" if distance is more than 15 and less or equal to 40.
- Prints "Far" if distance exceeds 40.



### Exercise 2:

Write a function that receives 2 params, first is an array of integers and the second an integer number. 
The function should print the count of numbers inside the array that are lower or greater than the second param.
	
  For example: 
 ```
 Array is: [110, 20, 100, 0, 200]
 Int number is: 100
 Result:
    "There are 2 numbers lower and 2 greater than 100"  
```
     

### Exercise 3:

Rewrite the following function using guard statements. You can use 2 guard statements or 1 compound guard statement. Actually, try both. :) 

```swift
func printIfPositiveInteger(number: String) {
    if let value = Int(number) {
        if value > 0 {
            print(value) 
        }
    }
}
printIfPositiveInteger(number: "abc") 
printIfPositiveInteger(number: "-10") 
printIfPositiveInteger(number: "10")
```

## 2) Constraints

The next challenge is to work with *Interface Builder (IB)* to achieve different behavior with the views like is explained in [this file](https://docs.google.com/document/d/1Go-wqzfStYejdIOvfJQhCTlmqnV03XKbt9b2wpkPdjk/edit). 


# Module 2

Now is time to create your own app, to do that follow the instructions [in the onboarding document](https://docs.google.com/document/d/1Wr-0y4im1lkTf6Fs94RNfeTsuhJcSXXdj7Mgs3JaTpw/edit#bookmark=id.87zjzru2egwf). 

