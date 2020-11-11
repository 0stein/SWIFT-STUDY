//variables
var age = 19
var student = ""
let languages: [String] = ["Java", "Python", "Swift"]
let capitals: [String: String] = [
    "한국": "서울",
    "일본": "도쿄",
    "중국": "베이징"
]
//

//조건을 검사할 때 if 나 switch 를 사용한다.
if age >= 8 && age < 14 {
  student = "초등학생"
} else if age < 17 {
  student = "중학생"
} else if age < 20 {
  student = "고등학생"
} else {
  student = "기타"
}

print(student)

//if문의 조건절에는 값이 정확하게 참 혹은 거짓으로 나오는 Bool 타입을 사용
//var number = 0
//if !number{ ... }  이런 조건절은 컴파일 에러가 발생한다.
//if number == 0 { ... } 이렇게 바뀌어야함

//다른 프로그래밍 언어의 Switch와 다르게 Swift는 case에 패턴 이 들어간다.
switch age {
    case 8..<14:    //범위 8 ~ 14 안에 age가 포함되었는지 여부를 검사한다.
        student = "초등학생"
    case 14..<17:
        student = "중학생"
    case 17..<20:
        student = "고등학생"
    default:
        student = "기타"
}


//반복문으로 배열, 딕셔너리 다루기
for language in languages {
    print("저는 \(language) 언어를 다룹니다.")
}
for (country, capital) in capitals {
    print("\(country)의 수도는 \(capital)입니다.")
}

//단순한 반복문을 만들때
for i in 0..<5{
    print(i)
}
// i를 사용하지 않는 단순 반복을 할 때 변수 이름 대신에 _를 사용 할 수 있다.
for _ in 0..<5{
    print("Hello")
}

//while 반복문.
var i = 0
while i< 100{
    i += 1
    print(i)
}