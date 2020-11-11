//클래스
class Dog {
    var name: String?
    var age: Int?

    func simpleDescription() -> String{
        if let name = self.name, let age = self.age {
            return "Im \(name) and \(age) years old"
        } else {
            return "fields are not fully allocated"
        }
    }
}

//구조체
struct Coffee {
    var name: String?
    var size: String?

    func simpleDescription() -> String {
        if let name = self.name , let size = self.size{
            return "coffee : \(name), size : \(size)"
        } else{
            return "fields are not fully allocated"
        }
    }
}

var myDog = Dog()   //myDog는 새로만들어진 Dog 를 참조합니다.
myDog.name = "초코"
myDog.age = 3
print(myDog.simpleDescription())

var myCoffee = Coffee()   //myCoffee 는 Coffe 그자체 입니다.
myCoffee.name = "아메리카노"
myCoffee.size = "Venti"
print(myCoffee.simpleDescription())

/*
클래스는 상속이 가능하지만 구조체는 불가능하다.
클래스는 참조 (reference) 하고 구조체는 복사(copy)
*/

class Toy {
    var price: Int?

    init() {
        price = 10000
    }
}

class Robot: Toy{
    var name: String?
    func walk() {
        print("walk walk")
    }
}

var myToy = Robot() //myToy는 새로만들어진 Robot()을 참조합니다.
myToy.walk()


//생성자는 속성의 초깃값을 지정
//속성이 옵셔널이 아니라면 항상 초깃값을 가져야한다. 가지지않으면 컴파일 에러.
class Apple {
    var name: String?
    var price: Int?

    /*
    init() {
        self.price = 5000
    }
    */

    init(name: String?, price: Int?){
        self.name = name
        self.price = price
    }

    func descriptor() {
        if let name = self.name, let price = self.price{
            print("\(name) \(price)")
        }else {
            print(" --")
        }
    }
}

var myApple = Apple(name: "GoldenApple", price: 1000)
// var myApple = Apple();
myApple.descriptor()

/*
상속받은 클래스라면 생성자에서 상위클래스의 생성자를 호출해 주어야한다.
만약 생성자의 파라미터가 상위 클래스의 파라미터와 같다면, override 키워드를
붙여주어야한다.
super.init() 은 클래스 속성의 초깃값이 모두 설정 된 후에 해야 한다.
그리고 나서 부터 자기 자신에 대한 self 키워드를 사용 할 수 있다.
*/

class Doll: Toy {
    var name: String?
    
    override init(){
        super.init()
        self.name = "Alisa" //부모의 생성자를 호출 한 후 부터 self 사용가능하다.
    }
    
    func descriptor() {
        if let name = self.name, let price = self.price{
            print("\(name) \(price)")
        }else {
            print(" --")
        }
    } 
}

var myDoll = Doll()
myDoll.descriptor()

/*
속성은 두가지로 나뉜다. 값을 가지는 Stored Prop, 계산되는 Computed Prop.
지금까지 name, age 등 이러한 속성은 stored 속성입니다. computed는 get set
을 사용해서 정의한다. set 에서는 새로 설정될 값을 newValue 라는 예약어를 통해
접근 할 수 있다.
*/

struct Hex {
    var decimal: Int?
    var hexString: String? {
        get{
            if let decimal = self.decimal {
                return String(decimal, radix: 16)
            }else{
                return nil
            }
        }
        set {
            if let newValue = newValue {
                self.decimal = Int(newValue, radix: 16)
            } else {
                self.decimal = nil
            }
        }
    }
    //get 만 정의할 때는 get 생략가능. 이런 속성을 읽기 전용 속성이라 한다.
    var hexCode: String? {
        if let hex = self.hexString{
            return "0x" + hex
        }
        return nil
    }
}

var hex = Hex()
hex.decimal = 10
if let h1 = hex.hexString{
    print(h1)
}

hex.hexString = "b"
if let h2 = hex.decimal{
    print(h2)
}

/*
get set 과 비슷한 willSet, didSet 을 이용하면 속성에 값이 지정되기 직전과
직후에 원하는 코드를 실행 할 수 있습니다.

*/

struct Hex {
    var decimal: Int? {
        //속성에 값이 지정되기 직전에 호출됨
        willSet {
            print("\(self.decimal)에서 \(newValue)로 값이 바뀔 예정.")
        }
        //속성에 값이 저장되고 난 후 호출됨
        didSet{
            print("\(oldValue)에서 \(self.decimal)로 값이 바뀌었습니다.")
        }
    }
}