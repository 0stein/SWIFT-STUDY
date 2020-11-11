var coffeeInfo = ("아메리카노", 5100)   //튜플
print(coffeeInfo.0)
print(coffeeInfo.1)
//튜플은 어떠한 값들의 묶음.

var namedCoffeeInfo = (coffee: "아메리카노", price: 5100)
print(namedCoffeeInfo.coffee)
print(namedCoffeeInfo.price)
//튜플의 파라미터에 이름을 붙일 수 있다.

//튜플의 타입 어노테이션
//var coffeeInfo: (String, Int)
//var namedCoffeeInfo: (coffee: String, price: Int)

//튜플을 이용해 변수에 값 할당.
// let (_, latteSize, lattePrice) = ("라떼", "Venti", 5600)    //_ 는 원하는 값 무시.

func coffeeInfoFunc(for name: String) -> (name: String, price: Int)? {
    let coffeeInfoList: [(name: String, price: Int)] = [
        ("아메리카노", 5100),
        ("라떼", 5600)
    ]
    for coffeeInfo in coffeeInfoList {
        if coffeeInfo.name == name {
            return coffeeInfo
        }
    }
    return nil
}

print(coffeeInfoFunc(for: "아메리카노")?.price)

let(_, lattePrice) = coffeeInfoFunc(for: "라떼")!
print(lattePrice)
