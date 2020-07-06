
// function sumArg() {
//     let sum = 0;
//     for(i=0 ; i < arguments.length; i++){
//         sum += arguments[i];
//     }
//     console.log(sum);
// }


// function sum(...nums) {
//     let sum = 0;
//     nums.forEach(ele => sum += ele);
//     console.log(sum);
// };

// //Ask why we are having trouble running both at the same time
// sumArg(1, 2, 3, 4);
// //10
// sumArg(1, 2, 3, 4, 5); 
// //15

// arguments way 
// Function.prototype.myBind = function (context) {
//     const that = this;
//     let arr = [];
//     for (i = 1; i < arguments.length; i++) {
//         arr.push(arguments[i]);
//     }
//     return function () {
//         for (i = 0; i < arguments.length; i++) {
//             arr.push(arguments[i]);
//         }
//         return that.apply(context, arr);
//     }
// }

// //... operator way
// Function.prototype.myBind = function (context, ...btimeArgs) {
//     const that = this
//     return function (...ctimeArgs) {
//           const combArgs = btimeArgs.concat(ctimeArgs)
//             return that.apply(context, combArgs)
//       }
// }

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

const curriedSum = function (numArgs) {
    const numbers = []
    function _curriedSum (num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return numbers.reduce(function(a, b) {
                return a + b 
            }); 
        } else {
            return _curriedSum; 
        }
    }
    return _curriedSum; 
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function (numArgs) {
    const numbers = []
    const that = this
    function _curriedSum (num) {
        numbers.push(numbers);
        if (numbers.length === numArgs) {
            return that.apply(null, numbers) 
        } else {
            return _curriedSum; 
        }
    }
    return _curriedSum;  
};

function fourSum(arg1,arg2,arg3,arg4){
    console.log(5,30,20,1);
};

// const sum = curriedSum(4);
sum(5)(30)(20)(1).curry(4)

// fourSum.curry()