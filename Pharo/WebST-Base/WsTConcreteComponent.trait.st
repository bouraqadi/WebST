Trait {
	#name : 'WsTConcreteComponent',
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'class initialization' }
WsTConcreteComponent classSide >> javascriptInitialize [

	self  registerTag
]

{ #category : 'accessing' }
WsTConcreteComponent classSide >> shadowHtml [

	<jsLiteralGenerator>
	^ self viewClass html
]
