//함수 와 클로저
//함수는 func 로 선언, -> 는 반환타입 정의
func hello(name: String, time: Int) -> String {
    var string = ""
    for _ in 0..<time {
        string += "\(name)님 안녕하세요! \n"
    }
    return string
}

print(hello(name: "유비", time: 3))

//함수 내부에서 다른 이름을 사용하고 싶다면 이렇게.
func bye(to name: String, numOfTimes time: Int) -> String{
    var string = ""
    for _ in 0..<time {
        string += "\(name)님 안녕히가세요! \n"
    }
    return string
}

print(bye(to: "유비", numOfTimes: 3))

//func bye(_ name: String,_ time: Int)
// _ 를 사용하면 함수 호출 시 이름을 생략 할 수 있다.
//ex) bye("관우", 3)


//인자의 갯수가 여러개.
func sum(_ numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

print("1 + 2 = \(sum(1, 2))")
print("4 + 1 + 3 = \(sum(4,1,3))")


//함수 안에 함수를 정의 할 수 있다.
func hello2(name: String, time: Int){
    func message(name: String) -> String{
        return "\(name)님 안녕하세요!"
    }

    for _ in 0..<time {
        print(message(name: name))
    }
}

hello2(name: "Kid", time: 3)

//함수안에 정의된 함수를 반환하는 것도 가능.
func helloGenerator(message: String) -> (String) -> String{
    func hello(name: String) -> String {
        return name + message
    }
    return hello
}

let hello3 = helloGenerator(message: "님 안녕하세요")
print(hello3("장비"))


//클로저는 중괄호 로 감싸진 '실행 가능한 코드블럭'입니다.
func helloGeneratorClosure(message: String) -> (String, String) -> String{
    return {(firstName: String, lastName: String) -> String in      
        return lastName + firstName + message
    }
}

let hello4 = helloGeneratorClosure(message: "님 안녕하세요!")
print(hello4("치수" , "채"))
//내부에 중괄호로 감싸진 함수같은 코드가 존재하고 클로저라고 부른다.
//함수의 이름이 정의되어 있지는 않으나 파라미터를 받고 반환한다는 점에서 함수와 동일하다.
//즉 함수는 이름이 있는 클로저이다.
//in 키워드를 사용해서 파라미터, 반환 타입 영역과 실제 클로저의 코드를 분리하고 있다.

/*
func helloGeneratorClosure(message: String) -> (String, String) -> String{
    return { firstName, lastName in
        return lastName + firstName + message
    }
}

Swift 의 타입 추론 덕분에 반환타입을 갖고 어떤 타입을 받는지, 어떤 타입을 반환하는지
알 수 있기 때문에 생략이 가능하다.

func helloGeneratorClosure(message: String) -> (String, String) -> String{
    return {
        return $1 + $0 + message
    }
}
더 간단히 해서 첫 번째 파라미터를 $0 두 번째 파라미터를 $1로 바꿔서 쓸 수 있다.
클로저 내부의 코드가 한줄이라면 return 도 생략 할 수 있다.

func helloGeneratorClosure(message: String) -> (String, String) -> String{
    
    return {$1 + $0 + message}
}
*/

//클로저는 변수처럼 정의 할 수 있다.
let greet: (String, String) -> String = { $1 + $0 + "님 안녕하세요!"}
print(greet("치수" , "채"))

/*
옵셔널로 정의 할 때.
let greet: ((String), String) -> String)?
greet?("치수", "채")
*/


//클로저를 파라미터로 넘겨주기
func manipulate(number: Int, using block: (Int) -> Int) -> Int {
    return block(number)
}
let outcome: Int = manipulate(number: 10, using: {
    (number: Int) -> Int in 
    return number * 2
})
// manipulate(number: 10, using: { $0 * 2 })
/*
함수의 마지막 파라미터가 클로저라면, 괄호와 파라미터 이름마저 생략 가능.
manipulate(number: 10){
    $0 * 2
}
*/

print(outcome)
