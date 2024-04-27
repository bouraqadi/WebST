Trait {
	#name : #WsTConcreteComponent,
	#category : #'WebST-Base-Components'
}

{ #category : #'class initialization' }
WsTConcreteComponent classSide >> javascriptInitialize [

	self  registerTag
]

{ #category : #accessing }
WsTConcreteComponent classSide >> shadowHtml [

	<jsLiteralGenerator>
	^ self viewClass html
]
