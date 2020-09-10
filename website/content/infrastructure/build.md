---
title: "Build the platform"
chapter: false
weight: 2
---

#### Navigate to the platform repo
```bash
cd ~/environment/{workshop_folder}/
```

#### Run NPM install to restore package dependencies
```bash
npm install
```

#### Confirm that the cdk can synthesize the assembly CloudFormation templates 
```bash
cdk synth
```

{{%expand "Fun exercise! Let's count the total number of lines to compare the code written in cdk vs the total lines of generated as CloudFormation. Expand here to see the solution" %}}

```bash
echo -e "Cloudformation Lines==$(cdk synth |wc -l)\nCDK Lines==$(cat lib/{workshop_stack}.ts|wc -l)"
```

- The end result should look something like this:

```bash
Cloudformation Lines=={X}
CDK Lines=={Y}
```

{{% /expand %}}

#### View proposed changes to the environment
```bash
cdk diff
```

#### Deploy the changes to the environment
```bash
cdk deploy --require-approval never
```

Let's take a look at what's being built. You may notice that everything defined in the stack is 100% written as Typescript code. We also benefit from the opinionated nature of cdk by letting it build out components based on well architected practices. This also means that we don't have to think about all of the underlying components to create and connect resources (ie, subnets, nat gateways, etc). Once we deploy the cdk code, the cdk will generate the underlying Cloudformation templates and deploy it.

```typescript
// TODO: insert CDK script
});
```

When the stack is done building, it will print out all of the outputs for the underlying CloudFormation stack. These outputs are what we use to reference the base platform when deploying our application. Below is an example of what the outputs look like:

```bash
Outputs:
{workshop_stack}.Site = http://MCSta-ALBAE-RB5J0KMY1MNW-436806623.eu-west-1.elb.amazonaws.com
```

That's it, we have deployed the infrastructure. Now let's move on to provisioning our servers.
