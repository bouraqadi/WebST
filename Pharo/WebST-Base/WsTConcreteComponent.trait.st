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

{ #category : 'class initialization' }
WsTConcreteComponent classSide >> javascriptInitialize [

	self  registerTag
]

{ #category : 'accessing' }
WsTConcreteComponent classSide >> shadowHtml [

	<jsLiteralGenerator>
	^ self viewClass htmlWith: [ : view | self beforeRendering: view ]
]
