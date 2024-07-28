Extension { #name : 'WAHtmlElement' }

{ #category : '*WebST-Base' }
WAHtmlElement >> renderOn: renderer [

	renderer renderHeadChild: self
]
