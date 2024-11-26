Class {
	#name : 'WsResourceRegistryTest',
	#superclass : 'TestCase',
	#instVars : [
		'registry'
	],
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'tests' }
WsResourceRegistryTest >> assertPathAt: id withPath: name [

	| rootPath actualPath |
	registry at: id putPath: name.
	rootPath := registry rootPath.
	actualPath := registry pathTo: id.
	self assert: (actualPath beginsWith: rootPath).
	self assert: (actualPath endsWith: name).
	self deny: (actualPath includesSubstring: '//')
]

{ #category : 'tests' }
WsResourceRegistryTest >> assertPathToResources [

	{
		(#image -> 'image.jpg').
		(#sound -> '/sound.mp3').
		(#lib -> 'my/js/folder/lib.js') } asDictionary keysAndValuesDo: [
		:id
		:name | self assertPathAt: id withPath: name ]
]

{ #category : 'tests' }
WsResourceRegistryTest >> assertRootPath: path [

	| actualPath |
	actualPath := registry rootPath.
	self deny: actualPath isNil.
	self deny: actualPath isEmpty.
	self assert: (actualPath beginsWith: path).
	self assert: actualPath last equals: $/.
	self assertPathToResources
]

{ #category : 'tests' }
WsResourceRegistryTest >> setUp [
	super setUp.
	registry := WsResourceRegistry new
]

{ #category : 'tests' }
WsResourceRegistryTest >> testDefaultRootPath [

	self assertRootPath: WsResourceRegistry defaultRootPath.

]

{ #category : 'tests' }
WsResourceRegistryTest >> testRootPath [

	#( '' '.' '..' 'some/path/' '/path/not/ending/with/slash' ) 
		do: [ :path |
			registry rootPath: path.
			self assertRootPath: path ]
]
