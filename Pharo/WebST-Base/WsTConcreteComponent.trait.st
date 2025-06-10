Trait {
	#name : 'WsTConcreteComponent',
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'rendering' }
WsTConcreteComponent classSide >> beforeRendering: rootView [

	<pharoJsSkip>
	^ self
]

{ #category : 'accessing' }
WsTConcreteComponent classSide >> findComponentClassesWith: aComponentClassFinder [

	<pharoJsSkip>
	aComponentClassFinder analyzeComponentClass: self

]

{ #category : 'class initialization' }
WsTConcreteComponent classSide >> javascriptInitialize [

	self  registerTag
]

{ #category : 'instance creation' }
WsTConcreteComponent classSide >> newComponentWaitingForSetupHtml [

	<jsLiteralGenerator>
	^ '<' , self tagName , ' data-wait-for-setup="true"></' , self tagName , '>'
]

{ #category : 'accessing' }
WsTConcreteComponent classSide >> shadowHtml [

	<jsLiteralGenerator>
	^ self viewClass htmlWith: [ : view | self beforeRendering: view ]
]

{ #category : 'accessing' }
WsTConcreteComponent classSide >> tagName [

	<jsLiteralGenerator>
	^ self name asKebabCase
]
