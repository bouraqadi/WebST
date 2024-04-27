Extension { #name : #WAHtmlElement }

{ #category : #'*WebSt-Base' }
WAHtmlElement >> renderOn: renderer [

	renderer renderHeadChild: self
]
