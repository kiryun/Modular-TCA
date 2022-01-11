# 개요

TCA를 공부하고 나서 내가 느낀 TCA의 단점은 하나이다. Feature에 파편화에 따른 관리의 복잡함.

이 단점을 보완하고자 생각한 [아이디어](https://github.com/kiryun/TIL/blob/master/Apple/TCA/TCA_101_after.md#%EC%8B%9C%EB%8F%84%ED%95%B4%EB%B3%BC%EB%A7%8C%ED%95%9C-%EA%B2%83%EB%93%A4)가 있는데 각 Feature의 모듈화이다. Tuist를 사용해서 PoC(Proof of Concept)를 해보고자 한다.

### 전체적인 App Feature 구조 및 View Flow

<img src="README.assets/image-20220108230657386.png" alt="image-20220108230657386" style="zoom:50%;" />

* Root
  * 모든 Feature들을 통합해서 하나의 App을 만들어준다.
* Login
  * Root에서 바로 MainFeature(TabBar)로 넘어가는 앱은 드물다. 보통은 Login 성공 시 MainView를 보여준다.
  * 이 경우 Login -> TabBar사이의 데이터 이동은 어떻게 되는지 한번 보도록 한다.
* TabBar
  * MainFeature 역할을 한다. 실제 앱의 전반적인 Feature를 갖고 있다.
* A ~ B
  * TabBar 아래에 있는 Feature(View)들

### Dependency Architecture (with SwiftPM)

<img src="README.assets/image-20220108232609591.png" alt="image-20220108232609591" style="zoom:50%;" />

* [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)
  * SwiftPM
* Effects
  * SwiftPM
  * Effects는 TCA를 dependency로 갖고 있다.
  * Effects에는 외부 dependency를 정의하고 있다.
* A0~B1
  * SwiftPM
  * App의 핵심 Feature들. 각 Feature들은 Effects를 dependency로 갖고 있다.
*  Modular-TCA
  * .xcodeproj
  * 실제 App을 구동시키는 프로젝트.
  * TabBar와 Login을 갖고 있다.
  * Login은 Login 기능을 담당하고 있으며, 처음 App을 실행하면 가장 먼저 마주하는 기능이다. Login에 성공하면 TabBar로 변경된다.
  * TabBar는 App의 핵심 View들을 표출한다.



### 이번 프로젝트에서 봐야 할 주요 포인트

* 모둘화(SPM) + TCA
* TCA에서 View간의 통신 
  * 같은 레벨에서의 통신
  * 서로 다른 레벨에서의 통신
    * 상위 -> 하위
    * 하위 -> 상위
  * Package 간의 통신
* TCA에서 SceneWindow교체
* Package간의 NavigationLink

# 구현

## Environments 

* OS
  * MacOS: 12.1
  * iOS: 15.2
* Xcode: 13.2.1 (13C100)
* TCA: 



## SwiftPM을 이용한 구현 생성







## Tuist를 이용한 구조 세팅

### 만들고자 하는 구조

* Modular-TCA.xcworkspace

  * <details>
      <summary>Modular-TCA.xcdoeproj</summary>
      - AppMain.swift(@main)
    </details>

    * <details>
        <summary>Modular-TCA</summary>
        - RootView.swift<br>
        - RootFeature.swift
      </details>

    * <details>
        <summary>Modular-TCATests</summary>
        - Modular-TCATests.swift
      </details>

  * Login.xcdoeproj

    * <details>
        <summary>Login</summary>
      </details>

    * <details>
        <summary>LoginTests</summary>
      </details>

  * TabBar.xcdoeproj

  * A.xcdoeproj

  * A'.xcdoeproj

  * B.xcdoeproj

  * B'.xcdoeproj

  * Effects.xcodeproj ( dynamic framework )

    * Effects.swift





