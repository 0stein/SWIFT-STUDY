var name_ = "Park"   //변수
let birthYear = 1995    //상수

//swift 는 정적 타이핑 언어이다.
var name: String = "Json"
let id: Int = 15545
var height: Float = 178.8
//변수나 상수를 정의할 때 자료형 이 어떤 것인지 명시하는 언어.

//height + id 같이 다른 자료형 끼리 기본적인 연산이 안됨.
Float(id) + height  //이 처럼 형변환을 해야 작동.
String(height) + "인" + name + "아 안녕"    //숫자를 문자열로 만들기.
"\(height) 인 \(name)아 안녕"   //위와 같은 문자열

//name_ 와 birthYear는 type을 명시해 주지 않았지만 Swift 컴파일러가
//주어진 값을 바탕으로 타입을 추론한다.

//배열과 딕셔너리
var languages = ["Swift", "python", "Java"]
var capitals = [
    "한국": "서울",
    "일본": "도쿄",
    "중국": "베이징"
]

languages[0] //Swift

capitals["한국"] //서울

//let으로 배열이나 딕셔너리를 선언 할 경우 값 수정,추가,제거 불가.
var fruits: [String] = ["Orange", "Tomato", "Melon"]
var classA: [String: Int] = [
    "안현수": 3,
    "서지태": 15,
    "각태웅": 22
] //타입 정의.

var books: [String] = []    //빈 배열 정의하기.
var classB: [String: Int] = [:] //빈 딕셔너리 정의하기.


