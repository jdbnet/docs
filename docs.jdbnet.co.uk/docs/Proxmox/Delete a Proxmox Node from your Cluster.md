To remove a node from your Proxmox cluster, follow these instructions.

Start by logging in to a different node within your cluster.

Migrate or delete all VMs and LXCs from the node you want to delete.

Remove any replication jobs to this node as well where applicable.

Once done, shutdown the node you want to delete.

Once you see it has a red cross in the GUI you can proceed.

Go to the shell of one of your nodes and issue the following commands...

The first command will delete the node. Replace ```oldnode``` with the node you want to delete's actual name.

```bash
pvecm delnode oldnode
```

Once this is done, you may see an error that says ```Could not kill node (error = CS_ERR_NOT_EXIST)```. This can be safely ignored.

Next run this command to confirm the node has been deleted (you should only see your remaining nodes).

```bash
pvecm nodes
```

You may then find that the node still shows up in the GUI with no status.

If this is the case, continue to follow these instructions...

Change to the nodes directory

```bash
cd /etc/pve/nodes/
ls
```

You should see your old node still here.

If so, use this command, again replacing ```oldnode``` with the actual node name you've deleted

```bash
rm -rf oldnode
```

Refresh your page and the node should now be gone.