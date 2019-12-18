# Example XSLT City Archives Amsterdam

The example is very simple and preliminary! It is used to learn about RiC-O and contains no decisions on mappings between EAD elements and RiC-O properties.

## Assumptions
* EAD contains no @level='item'
* @id of the component is in the ead:did-element (although it identifies extra-did data too ...)

## Lessons learned
* most Dutch Finding Aids do not contain rico:Record.

## XSLT transformation EAD into RDF/XML
We use xmllint to convert an example EAD file into RDF.

Usage examples:
```
xsltproc ead2rico.xslt 30157-9.ead.xml > 30157-9.rdf.xml
```

## Test RDF-syntax
We test the resulting XML/RDF by parsing it with raptor.

Usage example
```
rapper -o turtle 30157-9.rdf.xml > 30157-9.ttl
```
