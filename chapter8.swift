/*
프로토콜은 인터페이스이다. 구현은 하지않고 속성이나 메서드에 대한
명세입니다.
*/

protocol Sendable {
    var from: String? { get }
    var to: String { get }

    func send()    
}

/*
클래스나 구조체에 프로토콜을 적용 시킬 수 있다.
적용하면 정의한 속성과 메서드를 모두 구현해야한다.
*/

struct Mail: Sendable {
    var from: String?
    var to: String

    func send() {
        print("Send a mail from \(self.from!) to \(self.to)")
    }
}

struct Feedback: Sendable {
    var from: String? {
        return nil //피드백은 무조건 익명으로 보낸다.
    }
    var to: String 

    func send() {
        print("Send a feedback to \(self.to)")
    }
}


//프로토콜은 마치 추상클래스처럼 사용.
func sendAnyThing(_ sendable: Sendable){
    sendable.send()
}

let mail = Mail(from: "asdf@naver.com" , to: "json@hmail.com")
sendAnyThing(mail)

let feedback = Feedback(to: "kson@naver.com")
sendAnyThing(feedback)

//프로토콜은 다른 프로토콜을 상속할 수 있다.
//protocol Sendable: Messagable { .... }

//Any는 모든 타입에 대응한다.
let anyNumber: Any = 10
let anyString: Any = "Hi"

/*
AnyObject 는 모든 객체에 대응한다.
let anyInstance: AnyObject = SomeObj()

Any는 프로토콜이기 때문에
10을 할당했다 해서 Int 가 되는 것이 아니다.
'대응' 만 할 뿐.
*/

//Any 를 Int 로 변환하기 위해서는 as? 를 사용해서 옵셔널을 취해야한다.
let number: Int? = anyNumber as? Int

if let number = anyNumber as? Int {
    print(number + 1)
}

//타입검사
// print('변수이름' is '타입')


//유용한 protocol
struct Dog: CustomStringConvertible { //description 을 정의하도록 명세
    var name: String
    var description: String{
        return "name : \(self.name)"
    }
}


/*
Int(10) String("hi") 처럼 선언되어야 하는 것이 정석.
Int String 모두 생성자를 가지기 때문.
but 여태 var a: Int = 10 처럼 선언을 해왔는데 이렇게 생성자를 사용하지
않고 생성할 수 있게 만드는 것을 리터럴 이라고 부른다.
이 리터럴을 가능하게 해주는 protocol 이 ExpressibleByXXXLiteral 이다.
*/

struct DollarConverter: ExpressibleByIntegerLiteral {
    typealias IntegerLiterType = Int

    let price = 1_177
    var dollars: Int

    init(integerLiterType value: IntegerLiterType){
        self.dollars = value * self.price
    }
    
}

let converter: DollarConverter = 100
converter.dollars //117700


