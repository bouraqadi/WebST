Trait {
	#name : 'WsTSingleComponentTest',
	#instVars : [
		'component',
		'shadowRoot'
	],
	#traits : 'PjTAppRunsInJS + PjTWaitUntilReady',
	#classTraits : 'PjTAppRunsInJS classTrait + PjTWaitUntilReady classTrait',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> appClass [

	^ self appClassGenerator
		  appFor: self componentClass
		  attributes: self dataAttributes
		  style: self componentStyle
		  cssClasses: self componentCssClasses
		  appSuperclass: self appSuperclass
		  traits: self appTraits
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> appClassGenerator [
	^self appClassGeneratorClass current
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> appClassGeneratorClass [
	^WsComponentAppClassTestResource 
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> appSuperclass [

	^ WsParametrizableSingleComponentApp
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> appTraits [

	^ { WsTSingleComponentApp }
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> componentClass [
	self explicitRequirement 
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> componentCssClasses [

	^ nil
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> componentStyle [
	^nil
]

{ #category : 'accessing' }
WsTSingleComponentTest classSide >> dataAttributes [

	^ #(  )
]

{ #category : 'accessing' }
WsTSingleComponentTest >> allComponents [

	^ self document querySelectorAll: self componentTagName
]

{ #category : 'asserting' }
WsTSingleComponentTest >> assert: actualValue equalsDataAttributeAt: aSymbol [

	| expectedValue |
	expectedValue := self dataAttributeAt: aSymbol.
	self assert: actualValue equals: expectedValue
]

{ #category : 'accessing' }
WsTSingleComponentTest >> component [
	^component ifNil: [ component := self firstComponent ]

]

{ #category : 'accessing' }
WsTSingleComponentTest >> component: aComponent [

	component := aComponent.
	self waitUntil: [ component isStarted ].
	shadowRoot := component at: #shadowRoot
]

{ #category : 'accessing' }
WsTSingleComponentTest >> componentClass [

	^ self class componentClass
]

{ #category : 'accessing' }
WsTSingleComponentTest >> componentTagName [

	^ self componentClass tagName
]

{ #category : 'accessing' }
WsTSingleComponentTest >> dataAttributeAt: key [
	^self dataAttributesDict at: key
]

{ #category : 'accessing' }
WsTSingleComponentTest >> dataAttributesDict [

	^ self class dataAttributes asDictionary
]

{ #category : 'accessing' }
WsTSingleComponentTest >> firstComponent [
	^self allComponents first
]

{ #category : 'accessing' }
WsTSingleComponentTest >> shadowRoot [

	^ shadowRoot ifNil: [ shadowRoot := self component view ]
]
