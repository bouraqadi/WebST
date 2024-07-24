Trait {
	#name : 'WsTUrlTest',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'asserting' }
WsTUrlTest >> assertUrlFrom: aString equals: expectedUrl [

	| actualUrl |
	actualUrl := ZnUrl fromString: aString.
	self assert: actualUrl closePath equals: expectedUrl closePath
]

{ #category : 'asserting' }
WsTUrlTest >> assertUrlFrom: actualUrlString equalsUrlFrom: expectedUrlString [

	| expectedUrl |
	expectedUrl := ZnUrl fromString: expectedUrlString.
	self assertUrlFrom: actualUrlString equals: expectedUrl 
]

{ #category : 'asserting' }
WsTUrlTest >> assertUrlFrom: actualUrlString equalsUrlWithPath: expectedPathString [

	| expectedUrl |
	expectedUrl := self baseUrl / expectedPathString.
	self assertUrlFrom: actualUrlString equals: expectedUrl
]

{ #category : 'accessing' }
WsTUrlTest >> baseUrl [
	^self currentUrl clearPath; yourself
]

{ #category : 'accessing' }
WsTUrlTest >> currentUrl [
	^ ZnUrl fromString: self location href
]

{ #category : 'accessing' }
WsTUrlTest >> location [
	^self window location
]

{ #category : 'accessing' }
WsTUrlTest >> window [
	"JS web browser global root"
	self explicitRequirement 
]
