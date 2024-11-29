Trait {
	#name : 'WsTSingleComponentTest',
	#instVars : [
		'component',
		'shadowRoot'
	],
	#traits : 'PjTAppRunsInJS',
	#classTraits : 'PjTAppRunsInJS classTrait',
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

{ #category : 'accessing' }
WsTSingleComponentTest >> component [
	^component ifNil: [ component := self firstComponent ]

]

{ #category : 'accessing' }
WsTSingleComponentTest >> component: aComponent [

	component := aComponent.
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
WsTSingleComponentTest >> firstComponent [
	^self allComponents first
]

{ #category : 'accessing' }
WsTSingleComponentTest >> shadowRoot [

	^ shadowRoot ifNil: [ shadowRoot := self component view ]
]
